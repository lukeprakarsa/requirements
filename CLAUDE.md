# CS 0190 Requirements 2 (Pyret)

Luke (with a partner) is updating our Requirements 1 implementation and test suite based on the
mutual cross-testing feedback. The problem setup is identical to Requirements 1. This assignment
explicitly permits Claude Code, but Luke is responsible for every line and must be able to explain
it, so explain your reasoning and never make a spec-interpretation call on your own.

## Files

The final files must match the Req 2 starter (confirmed by staff on Ed #318). It has three files,
and each starts with `use context essentials2021`. The starter copies in `context/` don't show
that line; ours have it as line 1:

- `requirements-2-code.arr`: the implementation. It provides
  `check-requirements(courses :: List<String>) -> Completion` and may also contain tests of
  helpers. Keep the starter's parameter name, `courses`.
- `requirements-2-tests.arr`: tests of `check-requirements` only, never of helpers or other
  implementation details.
- `requirements-2-common.arr`: data bindings, such as test rosters, that both the code file and
  the tests file use. Test helpers such as `drop-course` live here too, each with its own check
  block (Luke, Nov 12), so the tests file holds only tests of `check-requirements`.
- `Completion` comes from the course's shared `requirements-2-definitions.arr` on Google Drive.
  In the browser starter, the `shared-gdrive` and `my-gdrive` include lines must stay exactly as
  given.

Locally we use the same three file names, function name and context, but `include file("...")`
in place of the Drive includes, so that `pyret` can run here:

- `reqs-common.arr` stands in for `requirements-2-definitions.arr` and defines the same
  `Completion`. Never modify it, never copy its definitions elsewhere, and never submit it.
  Despite its name, it is not the Req 2 "common" file. Copying `data Completion` into
  `requirements-2-common.arr` was tried on Nov 12 and removed: Pyret rejects it with "shadows a
  previous declaration of `completed`", because that file already includes the definitions (the
  browser starter's common file includes them too). Luke is checking Ed on whether anything about
  `Completion` has to be submitted.
- The common file includes `reqs-common.arr`. The code file includes `reqs-common.arr` and the
  common file. The tests file includes `reqs-common.arr`, the code file and the common file. Keep
  the starter's `provide *` and `provide-types *` lines.
- Only the include lines differ from the browser starter. Luke pastes into the browser starter
  everything after each file's "DO NOT CHANGE" line and the starter's `#` comment lines under it.
  In the code file that starts at the course-name constants (`UPPERCASE-LETTERS` and so on) and
  replaces the starter's stub. In the tests file it replaces the `check: 42 is 42 end` placeholder.
  In the common file it's `drop-course` and its check block.
- Top-level constants in the code file go above `fun check-requirements`. A non-function binding
  between functions splits Pyret's group of mutually visible functions, and every function above
  it then can't see the ones below it ("unbound" errors).

Reference files:

- `context/reqs-1-spec.md`: the Requirements 1 handout. This is the spec; Req 2 keeps the same
  problem setup.
- `context/reqs-2-spec.md`: the Requirements 2 handout.
- `context/bulletin-cs-scb.md`: the CS ScB requirements from the Brown Bulletin. These are the
  source of truth for the requirements themselves. The page scrape lost the requirements table;
  the Sc.B. table was transcribed from Luke's paste on Nov 12. The A.B. table isn't needed.
- `context/handbook.md`: the Concentrator Handbook. Use it only where the Bulletin defers to it,
  and only the rules for the current requirements year, because it also covers older years.
- `context/ed-clarifications.md`: staff answers from Ed, word for word. Treat these as part of
  the spec. If a question depends on an Ed post that isn't in the file, ask Luke.
- `context/feedback-impl-10.md`: how our implementation (impl-10) did against 18 suites. Its tests
  call our old function name, `check-reqs`.
- `context/feedback-suite-P.md`: how our suite (suite-P) did against 18 implementations.
- `scratch/`: local experiments only. Nothing here is submitted.
- `context/<starter folder>/`: the three Req 2 browser starter files. Copy their top sections
  (above "DO NOT CHANGE") exactly, except swap the Drive includes for local `include file(...)`.

## Running the tests

pyret-npm 0.1.28 is the newest release, and it has no `essentials2021` context. So
`pyret requirements-2-tests.arr` fails with "Could not find builtin module essentials2021".

- The real check is Luke pasting the files into the browser starter. He does this himself.
- For a quick local check, copy `reqs-common.arr` and the three `requirements-2-*.arr` files into
  a temp folder (`$CLAUDE_JOB_DIR/tmp` in background sessions). Change line 1 of the three copies
  to `use context starter2024` and run `pyret requirements-2-tests.arr` in that folder. Never
  change the context line in the real files. After cluster 1 (Nov 12) the tests file gave 187
  of 187.
- Don't use `essentials2020` for this: it has no `sort` function, and the code calls `sort` 4
  times. `essentials2021` has it (confirmed in the browser).
- If the CLI rejects something else, tell Luke instead of working around it in the lines above
  "DO NOT CHANGE".

## Status (updated Nov 12)

- The switch to the Req 2 layout is done and merged into `main` (Nov 12, fast-forward from
  `worktree-req2-layout`). Luke ran commit 2b16d27 in the browser starter, and every test passed.
  His commit 42d4538 renamed the parameter to `courses` but missed one `roster`. b50e783 fixes
  that and removes the copied `Completion`, and it passes 141 of 141 locally.
- Background sessions create worktrees from `origin/main`. If `origin/main` doesn't have the
  suite-P fixture rebuild (commit 8ac2c24: no `"CSCI 1970", "CSCI 1970"` in
  `requirements-2-tests.arr`), Luke hasn't merged and pushed it yet: ask him to.
- Not ready to submit. The code is still the Req 1 implementation, so everything below has to be
  done first:
  - Clusters 2 to 5 aren't fixed. Cluster 1 is done (below).
  - Known style problems in `requirements-2-code.arr`: `bool-to-num` is unused, there's
    `.get(0)` in `core-cs`, and `.{0}` tuple access in `four-add`.
- Suite-P fixtures rebuilt on `worktree-suite-p-fixtures` (Nov 12): the second `"CSCI 1970"` is now
  `"CSCI 1973"` (Bulletin footnote 4), and the two `four-add` combination tests became
  "one 197x course plus `CSCI 1005`". 141 of 141 locally. Luke confirmed the swap.
- Cluster 1 fixed on `worktree-cluster-1-malformed` (Nov 12): 33 new tests in 6 check blocks
  (24 failed before the fix), and `well-formed-course` replaces `bueno`. 187 of 187 locally. All
  45 cluster 1 inputs from the report now get the spec's answer. Five of them, like `"CSCI 01900"`
  and `"CSCI 1011*T"`, are well-formed by the spec even though their suites expected `malformed`.
- Cluster 2, part 1 on `worktree-cluster-2-irrelevant` (Nov 12): only courses that could count
  toward some requirement (`concentration-course`) can make a roster `has-unnecessary`, and the
  approved outside list is one constant with `"PHP  2630"` padded. 197 of 197 locally. On the
  249 parseable impl-10 feedback tests, passes went from 37 to 97 with no regressions.
- Cluster 2, part 2 (Nov 12): `check-requirements` trims every name to 9 characters
  (`drop-suffix`), the approved and non-technical lists hold trimmed names (Ed #321), and
  `approved-outside-course` adds every 1000-level MATH course. 211 of 211 locally; feedback
  passes 97 to 139, no regressions. Cluster 2 is done: the 7 tests left in it rest on open
  decisions (CSCI 0190 path extra slot, 3000+) or on the non-technical cap of 3.
- Luke confirmed (Nov 13) that MATH 1530 can be an outside elective when CSCI 0220 is the math
  foundation; tests for it are in the "approved outside courses" check blocks.
- Seen in passing for cluster 3: the code lets CSCI 0330 fill the Series C extra slot alongside
  CSCI 0300 (suite-Q line 403 now returns `completed` because of it).
- `NON-TECHNICAL-COURSES` keeps the Handbook's non-CS entries (APMA 1910, DEVL 1810, IAPA 1701,
  IAPA 1801, PLCY 1702), but the code only checks it against CSCI courses, so they never matter.
  Whether they count toward the cap of 3 is an open question for the style pass or Ed.
- Done Nov 12: every line of the three submitted files is 100 characters or fewer. Luke wrapped
  the starter's long comment lines under "DO NOT CHANGE" in the tests and common files.
- Before submitting: a final style-guide pass over every line of all three files, against every
  rule in the style guide below. Don't assume the Req 1 code is clean: Luke says it has style
  problems beyond the three listed above, and wants to see whether Claude finds them. Report
  them to Luke before fixing.

## Spec facts that settle disputes (Req 1 handout)

- A course name is 4 uppercase letters, a space, and 4 digits. Three-letter departments are padded
  with a space, so `"PHP  2630"` (two spaces) is well-formed and `" PHP 2630"` is malformed.
- Ignore everything after the four digits: `"CSCI 2951S"`, `"CSCI 2951-S"` and
  `"CSCI 0190hahaha"` are all well-formed.
- Courses irrelevant to the concentration are ignored. An irrelevant course never makes a roster
  `has-unnecessary`.
- Assume no course is listed more than once. A test that repeats a course is outside the spec, so
  don't write one and don't try to make one pass.
- Priority runs malformed > completed > has-unnecessary > all-necessary. An empty roster counts as
  progress.
- Requirements come from the Bulletin, and from the Handbook only where the Bulletin defers to it.
  Ignore legacy clauses and the Capstone.

## Feedback triage (done Nov 11)

Implementation impl-10 failed 258 of 1378 tests. "Strong" below means at least 13 of the other 17
implementations passed the test.

1. **Malformed check is wrong in both directions.** 45 tests (40 strong) expect `malformed` and we
   return something else, for inputs like `"CSCI-0190"`, `"C5CI 0190"`, `"1234 0190"`,
   `"CSCI\t0190"`, `" PHP 2630"`, `"CS I 0190"` and `"CSCI 1.50"`. We also return `malformed` for
   names with text after the digits, which the spec says to ignore.
2. **Irrelevant courses are counted as unnecessary.** Most of the 81 tests (57 strong) that expect
   `all-necessary` while we return `has-unnecessary`. Examples are `[list: "HIST 0150"]`,
   `"MATH 9999"`, `"PHP  0060"` and suffixed codes like `"CSCI 0190A"`. We also fail to recognize
   `"PHP  2630"` as an approved outside course.
3. **Redundancy inside a pick-one group is missed.** 56 tests (29 strong) expect `has-unnecessary`
   and we return `all-necessary`. The core cases are `MATH 0100` with `MATH 0170`, and
   `CSCI 0300` with `CSCI 0330`.
4. **Course allocation needs search, not a greedy pass.** Examples are `CSCI 0220` together with
   `MATH 1530`, and the CSCI 0190 path's extra course. Several suites name their tests
   "wrong greedy solution". Most of the 64 "should be completed" failures are here.
5. **Contested rules** (8 or fewer of 17 agree) are caps and exclusive pairs. Settle them from the
   Bulletin; see the decisions log below.

Deprioritize suite-L: 24 of our 29 failures on it were passed by at most 3 other implementations,
so it is the outlier suite. Also ignore every test that lists a course twice. When a test report
shows an `Input:` block, that block is the expanded roster.

Our test suite, suite-P, has two problems:

- Fixed Nov 12 (commit 8ac2c24). All 15 tests that at least half the implementations failed were
  built on `exact-completed-roster`, which listed `"CSCI 1970"` twice, outside the spec. The
  fixtures now end with `"CSCI 1970", "CSCI 1973"`.
- The suite never caught impl-10's two biggest bugs (clusters 1 and 2). Add tests for clusters 1
  to 4, written by us rather than copied from other suites.

## Decisions log (Luke fills these in; Claude never decides them)

Each line notes how the other implementations split.

- [x] MATH 1530 can count as an additional elective (an approved outside course, toward the cap
      of 3) when CSCI 0220 is the math foundation (Nov 13, Luke). It is a 1000-level MATH
      course. `[list: "CSCI 0220", "MATH 1530"] is all-necessary`: 13 of 17 agree.
- [ ] On the CSCI 0190 path, what fills the extra-course slot? Can CSCI 0220 fill it while
      MATH 1530 is the math foundation? Suites B, O, Q and R split around 10 to 12 of 17.
- [x] Non-technical CSCI courses (Nov 12, from the Bulletin table): none can fill a technical
      slot (footnote 3: "None of these can be CS non-technical courses"), and at most 3 can fill
      additional slots ("no more than three non-technical courses"). So
      `[list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1370"] is has-unnecessary`.
- [ ] Which pairs are mutually exclusive? ENGN 2520 with CSCI 1420 split 8 to 9; DATA 1340 with
      CSCI 1951A got 4 of 17; EEPS 1340 with DATA 1340 got 4 of 17.
- [x] 2000-level CSCI courses can fill technical slots unless they're non-technical (Ed #786:
      "If those 2000-level courses are also Technical, then yes."). 12 of 17 agreed.
- [x] A course is unnecessary when it could count toward a requirement but every slot it could
      fill is taken (Nov 12). 1000- and 2000-level CSCI courses can fill the 5 technical slots
      (technical courses only), the 4 additional slots and, on Series C, the extra course ("may
      be ... a 1000-level course"). So at most 9 of them can all count, or 10 on Series C.
- [x] Department format (Nov 12, Luke, from Req 1 handout section 6: "All courses will have four
      letters. Department names with only three letters (like PHP) will be padded with an extra
      space"): the department is 4 uppercase letters, or 3 uppercase letters and one space. So
      `"CS   0190"` and `"C    1011-T"` are malformed. On suite-L line 30, 12 of 17 agreed.
- [x] Approved outside courses: additional slots only, at most 3 ("Up to three approved
      1000-level courses outside of CS"), and only one of APMA 1650 and 1655 (Nov 12).
- [x] Suffixes (Nov 12, Ed #321: "Count them as in"): a name counts as its first 9 characters.
      An approved outside course stays approved under any suffix, so `"ENGN 1931C"` counts even
      though the Handbook denies it, and the suffixed CSCI non-technical courses (1952B, 1952X,
      2402C, 2952S, 2999A) count as technical (Req 1 handout: "treat all of them as technical").
- [x] Every 1000-level MATH course is an approved outside course (Nov 12, Luke; Handbook list:
      "Math: all 1000-level math courses"). 2000-level MATH courses are not.
- [x] Two names that are the same course once trimmed (`"CSCI 2951A"`, `"CSCI 2951B"`) list one
      course twice, which is outside the spec: write no tests for it (Nov 12, Luke). Suite-M
      lines 228, 231 and 422 do this; 11 of 17 expected `all-necessary`.
- [ ] Can CSCI courses numbered 3000 or above fill elective slots? They are valid courses (Req 1
      handout: "assume every course listed is a valid one") and can be the Series C extra course
      ("numbered 200 or above"), as our line 111 test uses `CSCI 3000`. But the elective rows
      name only "1000-level and 2000-level CSCI courses". The majority treats them like other
      upper-level CSCI courses: on suite-E line 223, 11 of 17 counted `CSCI 9999` as technical
      (5 said additional only); suite-J line 199 (3000+ as technical) passed on 9 of 17. Our code
      agrees (`cs-at-least` has no upper bound). Until settled, write no tests that depend on it;
      Luke may ask on Ed.

## How to work with Luke

- Before changing any behavior that rests on an interpretation, quote the spec or Bulletin line it
  depends on. If the decisions log doesn't settle the question, stop and ask.
- Don't make a feedback test pass just because most implementations pass it. Majority is evidence,
  not truth.
- Write tests first: add a test that captures the rule and fails on the current code, then change
  the implementation.
- Work on one cluster at a time and keep diffs small. After each change, explain in a few
  sentences what changed and why.
- When Claude creates a branch Luke will keep working on, switch Luke's main checkout to it.
  Remove any worktree holding the branch first, since git won't check out a branch that's in use
  in another worktree. Luke pushes; Claude doesn't (the permission check blocked it on Nov 12).
- New code must not add style violations. The style guide applies only to the three submitted
  `.arr` files (not `reqs-common.arr`, `scratch/` or CLAUDE.md). Before each commit, check every
  added line against each style-guide rule, and every line of each touched file for length,
  not just the added ones. Say in the summary that you did. Cluster 1 missed 16 existing lines
  over 100 in the tests file and added two long triple-tick docstrings (Nov 12).
- After a style fix, show Luke what changed and wait for him to confirm nothing is left before
  pushing, even if he has already said to push once the style is sorted.
- `scratch/feedback-check.arr` may hold tests taken from the feedback reports whose expected
  results agree with the spec and the decisions log. It is a local regression check only. Never
  copy those tests into `requirements-2-tests.arr`.

## CS 19 Pyret style guide (graded)

- **Types:**
  - Deconstruct multi-variant data with `cases`, not field access, `if` or `ask`.
  - No `| else` in `cases`, and don't use `cases` and then dereference fields.
  - Annotate every input and output, including type parameters (`List<String>`). Never use `Any`.
  - Use tuples only when they are destructured immediately; otherwise write a data definition.
- **Idioms:**
  - Use descriptive names, including for test example values.
  - Nest a helper only if it is bespoke, captures outer parameters, hides recursion parameters, or
    clarifies a higher-order function. Never nest a helper inside a nested helper.
  - No dangerous defaults like -1; use `Option` or `raise` instead.
  - Write `c`, never `if c: true else: false`.
  - No list `get`/`set`, and no `.first`/`.rest`.
  - Name magic numbers as constants.
  - Use `ask` when there are more than 2 branches.
  - Give informative error messages.
  - Use UpperCamelCase for types, ALL-CAPS for constants (`DEPT-LENGTH`), and lower-kebab-case
    for everything else (Luke, Nov 12).
  - Lambdas don't need annotations (Luke, Nov 12).
- **Readability:**
  - Every function has a `doc:` purpose statement saying what it does, not how. Keep it short,
    one line where possible: long docstrings cost points (Luke, Nov 12). Let the examples show
    the details.
  - Put each function right before its check block.
  - Give check blocks descriptive strings.
  - No unused code.
- **Formatting:**
  - Keep lines to 100 characters or fewer; use triple-tick docstrings to wrap.
  - Don't let functions get too tall.
  - Use Pyret's default indentation.
  - No lonely closing parens.
  - Put a space after `|` and after commas, and no extra spacing.

## Course rules

- `check-requirements` gets the assignment URL as its docstring
  (https://cs.brown.edu/courses/csci0190/2026/reqs-2.html).
- Every helper needs a docstring unless its purpose is obvious from its name, header or examples.
  Nontrivial helpers always need one.
- Test `check-requirements` extensively in `requirements-2-tests.arr`. Give each helper 2 or 3
  tests that cover the edge cases the code depends on: implementation helpers in
  `requirements-2-code.arr`, test helpers (like `drop-course`) in `requirements-2-common.arr`.
- Don't write comments in the three submitted files. Luke counts them as extraneous. Only the
  starter's own comments stay.
- **Allowed:** the core language, higher-order functions, our own data definitions, and the
  Number, String and Boolean builtins. The allowed libraries are lists, sets, pick, tables, option
  and either. Nothing else.
- **Not allowed:** `var`, `:=`, `ref` and `!`.
