"""Local checks for the Req 2 repo. Not submitted.

Run from the repo root:

  python3 -I scratch/feedback.py local [FILE]
      Run FILE (default requirements-2-tests.arr) from the working tree, with line 1 of each
      requirements-2-*.arr copy changed to `use context starter2024` (the CLI has no
      essentials2021). Prints only failing blocks and the totals.

  python3 -I scratch/feedback.py run REV OUT.json
      Run every runnable test in context/feedback-impl-10.md against the code at git REV
      (a commit, a branch, or WORKTREE for the files on disk) and save each result to OUT.json.
      The report lists only tests impl-10 failed, and some of them disagree with the spec or
      the decisions log: a failure here is evidence to weigh, not a bug by itself.

  python3 -I scratch/feedback.py compare OLD.json NEW.json
      List the tests whose result changed between two runs. A REGRESSION line is a test that
      passed in OLD and fails in NEW.

  python3 -I scratch/feedback.py show RESULTS.json [EXPECTED [GOT]]
      List the failing tests, most-agreed-with first, optionally only those that expect
      EXPECTED and get GOT (for example: show new.json all-necessary has-unnecessary).
"""
import json
import os
import re
import subprocess
import sys
import tempfile
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
REPORT = os.path.join(ROOT, 'context', 'feedback-impl-10.md')
FILES = ['reqs-common.arr', 'requirements-2-common.arr', 'requirements-2-code.arr',
         'requirements-2-tests.arr']
OUTCOMES = 'malformed|completed|has-unnecessary|all-necessary'


def work_dir():
    job = os.environ.get('CLAUDE_JOB_DIR')
    base = os.path.join(job, 'tmp') if job else tempfile.gettempdir()
    return tempfile.mkdtemp(prefix='reqs-', dir=base)


def read_at(rev, name):
    if rev == 'WORKTREE':
        with open(os.path.join(ROOT, name)) as f:
            return f.read()
    return subprocess.run(['git', '-C', ROOT, 'show', '%s:%s' % (rev, name)], check=True,
                          capture_output=True, text=True).stdout


def stage(rev, folder):
    for name in FILES:
        text = read_at(rev, name)
        if name.startswith('requirements-2-'):
            text = re.sub(r'\A[^\n]*', 'use context starter2024', text)
        with open(os.path.join(folder, name), 'w') as f:
            f.write(text)


def pyret(folder, name):
    """Run pyret with its output in a file. With a pipe, a compile server that pyret starts
    inherits the pipe and keeps it open, so reading it never finishes."""
    log = os.path.join(folder, name + '.out')
    with open(log, 'w') as f:
        subprocess.run(['pyret', name], cwd=folder, stdin=subprocess.DEVNULL, stdout=f,
                       stderr=subprocess.STDOUT, timeout=900)
    with open(log) as f:
        return f.read()


def parse_report():
    """Split the report into tests. Block names can wrap onto a second line."""
    with open(REPORT) as f:
        text = f.read()
    parts = re.split(r'\n\*\*(suite-\w), line (\d+)\*\* \(check block: (.*?)\)\n\n', text,
                     flags=re.S)
    tests, skipped = [], []
    for i in range(1, len(parts), 4):
        body = parts[i + 3].split('\n### ')[0]
        codes = re.findall(r'```\n(.*?)\n```', body, re.S)
        code = re.sub(r'#[^"\n]*$', '', codes[0] if codes else '', flags=re.M).strip()
        expected = re.search(r'\bis\s+(%s)$' % OUTCOMES, code)
        given = re.search(r'Input:\s*\n+```\n(.*?)\n```', body, re.S)
        if given:
            roster = given.group(1)
        else:
            inline = re.search(r'^check-reqs\((.*)\)\s+is\s', code, re.S)
            roster = inline.group(1) if inline else None
        others = re.search(r'Of the other 17 implementations: (\d+) passed', body)
        test = dict(suite=parts[i], line=int(parts[i + 1]), block=' '.join(parts[i + 2].split()),
                    expected=expected.group(1) if expected else None,
                    roster=roster.replace('\n', ' ') if roster else None,
                    others_passed=int(others.group(1)) if others else None)
        runnable = (test['roster'] and test['expected'] and 'check-reqs' not in test['roster']
                    and not re.search(r'[a-z]\w*-\w', re.sub(r'"[^"]*"', '', test['roster'])))
        (tests if runnable else skipped).append(test)
    return tests, skipped


def run(rev, out):
    tests, skipped = parse_report()
    folder = work_dir()
    stage(rev, folder)
    with open(os.path.join(folder, 'feedback-check.arr'), 'w') as f:
        f.write('use context starter2024\ninclude file("reqs-common.arr")\n'
                'include file("requirements-2-code.arr")\n\n')
        for n, test in enumerate(tests):
            f.write('check "fb%d %s %d":\n  check-requirements(%s) is %s\nend\n\n'
                    % (n, test['suite'], test['line'], test['roster'], test['expected']))
    output = pyret(folder, 'feedback-check.arr')
    results = {}
    for chunk in re.split(r'\n(?=file://)', output):
        block = re.search(r': fb(\d+) suite-\w \d+ \((\d+)/1\)', chunk)
        if block:
            got = re.search(r'Values not equal\s+(\S+)\s+(\S+)', chunk)
            passed = block.group(2) == '1'
            results[int(block.group(1))] = 'pass' if passed else (got.group(1) if got else 'error')
    if len(results) != len(tests):
        sys.exit('Got %d results for %d tests. Pyret output ends:\n%s'
                 % (len(results), len(tests), output[-2000:]))
    for n, test in enumerate(tests):
        test['result'] = results[n]
    with open(out, 'w') as f:
        json.dump(tests, f, indent=1)
    wrong = Counter((t['expected'], t['result']) for t in tests if t['result'] != 'pass')
    print('%s: %d of %d runnable tests pass (%d not runnable: helper calls or comments)'
          % (rev, len(tests) - sum(wrong.values()), len(tests), len(skipped)))
    for (expected, got), count in wrong.most_common():
        print('  expected %-15s got %-15s %d' % (expected, got, count))


def describe(test):
    return '%2s/17 %s:%d [%s] expects %s\n       %s' % (
        test['others_passed'], test['suite'], test['line'], test['block'][:70],
        test['expected'], test['roster'][:180])


def compare(old_path, new_path):
    def load(path):
        with open(path) as f:
            return {(t['suite'], t['line'], t['roster']): t for t in json.load(f)}
    old, new = load(old_path), load(new_path)
    for key in sorted(old.keys() & new.keys(), key=lambda k: (k[0], k[1])):
        before, after = old[key]['result'], new[key]['result']
        if before != after:
            label = 'REGRESSION' if before == 'pass' else 'changed'
            print('%-10s %s -> %s  %s' % (label, before, after, describe(new[key])))


def show(path, expected=None, got=None):
    with open(path) as f:
        tests = json.load(f)
    chosen = [t for t in tests if t['result'] != 'pass'
              and (expected is None or t['expected'] == expected)
              and (got is None or t['result'] == got)]
    for test in sorted(chosen, key=lambda t: -(t['others_passed'] or 0)):
        print('got %-15s %s' % (test['result'], describe(test)))
    print('%d tests' % len(chosen))


def local(name='requirements-2-tests.arr'):
    folder = work_dir()
    stage('WORKTREE', folder)
    for line in pyret(folder, name).split('\n'):
        passed_block = re.search(r'\((\d+)/(\d+)\)\s*$', line)
        noise = re.search(r'Compiling|compiled|Cleaning up|Gathering|Loading existing', line)
        if line.strip() and not noise and not (
                passed_block and passed_block.group(1) == passed_block.group(2)):
            print(line)


if __name__ == '__main__':
    commands = {'run': run, 'compare': compare, 'show': show, 'local': local}
    if len(sys.argv) < 2 or sys.argv[1] not in commands:
        sys.exit(__doc__)
    commands[sys.argv[1]](*sys.argv[2:])
