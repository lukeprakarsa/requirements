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
- `scratch/`: local experiments only. Nothing here is submitted. `scratch/feedback.py` runs the
  local tests and the feedback-report checks (see "Running the tests").
- `context/<starter folder>/`: the three Req 2 browser starter files. Copy their top sections
  (above "DO NOT CHANGE") exactly, except swap the Drive includes for local `include file(...)`.

## Running the tests

pyret-npm 0.1.28 is the newest release, and it has no `essentials2021` context. So
`pyret requirements-2-tests.arr` fails with "Could not find builtin module essentials2021".

- The real check is Luke pasting the files into the browser starter. He does this himself.
- For a quick local check, run `python3 -I scratch/feedback.py local` from the repo root (add
  `requirements-2-code.arr` to run the helper tests). It copies `reqs-common.arr` and the three
  `requirements-2-*.arr` files into a temp folder (`$CLAUDE_JOB_DIR/tmp` in background sessions),
  changes line 1 of the three copies to `use context starter2024`, and runs `pyret`. Never
  change the context line in the real files. After cluster 5, part 2 (Nov 13): tests file 275 of
  275, code file 119 of 119.
- `scratch/feedback.py run REV OUT.json` runs every runnable test from
  `context/feedback-impl-10.md` against the code at a commit (or `WORKTREE`); `compare` lists the
  results that changed between two runs and flags regressions; `show` lists failures. 249 of the
  report's tests are runnable (7 call suite helpers). Passes: 37 before cluster 2 (df23cd9), 97
  after part 1 (0350760), 139 after part 2 (4537f3a), 168 after cluster 3, part 1 (a3918f3),
  176 after cluster 3, part 2 (bd354c3), 178 after cluster 4, part 1 (59ae56b), 185 after
  cluster 4, part 2, 194 after the pairs (1fd3855), 195 after the Ed #257 merge, 195 after
  cluster 5, part 2 (suite-J 226 gained, suite-Q 104 lost, both expected). The report
  holds only tests impl-10 failed, and some contradict the spec or the decisions log, so a
  failure there is evidence to weigh, not a bug by itself. Run it before and after each change
  to catch regressions. The generated check file stays in the temp folder: it holds every
  report test, so never copy it into `scratch/` or the tests file.
- Don't use `essentials2020` for this: it has no `sort` function, and the code calls `sort` 4
  times. `essentials2021` has it (confirmed in the browser).
- Never read `pyret` output through a pipe (`pyret f | grep`, `$(pyret f)`, Python
  `capture_output`). When no compile server is running, `pyret` starts one, the server keeps the
  pipe open, and the reader waits forever (Nov 13, after a restart). Send the output to a file
  instead: `pyret f > out.txt 2>&1 < /dev/null`, as `scratch/feedback.py` now does.
  `pyret --shutdown` stops the server.
- Pyret rejects a name that shadows a built-in: parameters named `text` or `drop` don't
  compile.
- If the CLI rejects something else, tell Luke instead of working around it in the lines above
  "DO NOT CHANGE".

## Status (updated Nov 13)

- The switch to the Req 2 layout is done and merged into `main` (Nov 12, fast-forward from
  `worktree-req2-layout`). Luke ran commit 2b16d27 in the browser starter, and every test passed.
  His commit 42d4538 renamed the parameter to `courses` but missed one `roster`. b50e783 fixes
  that and removes the copied `Completion`, and it passes 141 of 141 locally.
- Background sessions create worktrees from `origin/main`. If `origin/main` doesn't have the
  cluster 2 hand-off (commit 76b8e65: `scratch/feedback.py` exists), Luke hasn't merged and
  pushed it yet: ask him to.
- Before the next session: if Luke said to push, `worktree-cluster-5-pairs` is on origin and
  merged into `main`; otherwise ask him whether to push and merge it first.
- Not ready to submit. Everything below has to be done first:
  - Clusters 1 to 5 are done once Luke runs `worktree-cluster-5-settled` in the browser
    starter. Part 1: exclusive pairs and the Ed #257 merge. Part 2 (Nov 13, not pushed): Luke
    settled the last four decisions-log items; only the unlisted 200 to 999 rule changed code
    (`concentration-course` takes `on-series-c`; `NAMED-INTERMEDIATE-COURSES`). 8 new tests in
    2 check blocks (3 failed before), including tests of the three rules the code already
    followed. No open decisions-log items are left.
  - Style pass done on `worktree-style-pass` (e7023c0, Nov 13, no behavior change): every
    item from Claude's review and the old known list is fixed (constants, removed helpers,
    names, docstrings, check names, `missing-core-c` now uses the Series C roster, trailing
    spaces). Luke reviewed the diff and confirmed it, and ran e7023c0 in the browser starter
    (Nov 13): every test passed.
- Suite-P fixtures rebuilt on `worktree-suite-p-fixtures` (Nov 12): the second `"CSCI 1970"` is now
  `"CSCI 1973"` (Bulletin footnote 4), and the two `four-add` combination tests became
  "one 197x course plus `CSCI 1005`". 141 of 141 locally. Luke confirmed the swap.
- Cluster 1 is done and merged into `main` (df23cd9, Nov 12), and Luke passed it in the browser
  starter. 33 new tests in 6 check blocks (24 failed before the fix), and `well-formed-course`
  replaces `bueno`. 187 of 187 locally. All 45 cluster 1 inputs from the report now get the
  spec's answer. Five of them, like `"CSCI 01900"` and `"CSCI 1011*T"`, are well-formed by the
  spec even though their suites expected `malformed`.
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
- Luke ran 372395b in the browser starter (Nov 13): every test passed. Cluster 2 was pushed and
  fast-forwarded into `main` (4537f3a, Nov 13).
- Cluster 3, part 1 on `worktree-cluster-3-pick-one` (a3918f3, Nov 13, not pushed): `prereqs`
  marks one calculus course, not all of them, and `check-requirements` drops `CSCI 0330` from
  the courses that can fill slots when `CSCI 0300` is there (`keep-one-systems-course`), so
  0330 can't be the Series C extra next to 0300. 9 new tests in 2 check blocks (7 failed
  before the fix). Feedback passes 139 to 168. The one changed-to-fail test, suite-Q line 403
  (expects `completed`, 4 of 17 passed it), completes only if 0330 is the extra next to 0300,
  which the Nov 13 decision rules out.
- Cluster 3, part 2 (bd354c3, Nov 13, not pushed): `core-cs` no longer sets aside a course as
  the Series C extra when the roster has no intro course (decisions log, Nov 13). 5 new tests
  in 1 check block, with the `nine-cs-electives` and `ten-cs-electives` rosters (2 failed
  before the fix), and one `core-cs` helper test. Feedback passes 168 to 176, no regressions;
  suite-Q line 104 passes only because `CSCI 0340` now counts as unnecessary (see the open
  "unlisted 200 to 999" item).
- Cluster 4, part 1 on `worktree-cluster-4-search` (59ae56b, Nov 13, not pushed): the Series
  C extra is filled last, from CSCI courses from 200 up that nothing else used
  (`series-c-extra`), and `four-add` prefers linear algebra and outside courses over CSCI ones.
  5 new tests in 1 check block (2 failed before). Local: tests file 240 of 240, code file 113
  of 113. Feedback passes 176 to 178 (suite-C 69, suite-B 317), no regressions. Suite-B 317
  passes because a 4th non-technical course (CSCI 1800) is the extra, which the Nov 13
  decision allows.
- Cluster 4, part 2 (24cc600, Nov 13, not pushed): `check-requirements` runs `allocate` twice, with
  CSCI 0220 and then MATH 1530 tried first as the math foundation, and `better-completion`
  keeps the better result. 5 new tests in 1 check block plus one non-technical-extra test
  (2 failed before). Local: tests file 255 of 255, code file 122 of 122. Feedback passes
  178 to 185, no regressions. The duplicate `trimmed-courses.length() == 0` branch and the
  `tech-elect-seen` typo went with the move. Cluster 4
  is done: the "should be completed" failures left are suite-L outliers (22, most with no
  calculus course), 0330 next to 0300 (suite-N 153, suite-Q 403), non-technical as technical
  (suite-A 117), and one CSCI 1973 filling two slots (suite-O 211, 216). Luke ran 24cc600 in
  the browser starter (Nov 13): every test passed, so cluster 3 has passed there too.
- Cluster 5, part 1 on `worktree-cluster-5-pairs` (Nov 13, not pushed). 1fd3855: the
  Handbook's exclusive pairs (decisions log). `drop-when-present` sets ENGN 2520 aside when
  CSCI 1420 is there; for CSCI 1951, `check-requirements` tries setting aside DATA 1340 and
  EEPS 1340, then CSCI 1951, and keeps the better result (`best-allocation`); `allocate` now
  takes the full roster and the countable courses separately. 12 new tests in 2 check blocks
  (7 failed before). Feedback 185 to 194 (suite-B 147, 149, 151, 237; C 105, 106; E 155;
  K 76; O 139). Then the Ed #257 merge: `check-requirements` applies `distinct` after
  trimming. 3 new tests in 1 check block (1 failed before). Feedback 194 to 195 (suite-M
  222); suite-L 52 changed from `has-unnecessary` to `all-necessary` but fails either way
  (it lists `"CSCI 1230"` twice). Suite-O 135 (DATA 1340 with EEPS 1340) still fails, as
  decided. Luke ran 1c19a2b in the browser starter (Nov 13): every test passed.
- Cluster 3 is done. The 17 report tests that still expect `has-unnecessary` and get
  `all-necessary`: 7 list a course twice (out of scope), 9 are exclusive pairs and 1 is the
  shared non-technical cap (both open).
- `NON-TECHNICAL-COURSES` keeps the Handbook's non-CS entries (APMA 1910, DEVL 1810, IAPA 1701,
  IAPA 1801, PLCY 1702), but the code only checks it against CSCI courses, so they never matter.
  Whether they count toward the cap of 3 is an open decisions-log item.
- Done Nov 12: every line of the three submitted files is 100 characters or fewer. Luke wrapped
  the starter's long comment lines under "DO NOT CHANGE" in the tests and common files.
- Final style-guide pass (Nov 13): Claude reported 10 findings beyond the known list, Luke
  approved fixing all of them, with inline course names as named constants, and they're in
  e7023c0. After any later code change, check every line again against every rule.

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

1. **(Done Nov 12.) Malformed check is wrong in both directions.** 45 tests (40 strong)
   expect `malformed` and we return something else, for inputs like `"CSCI-0190"`,
   `"C5CI 0190"`, `"1234 0190"`, `"CSCI\t0190"`, `" PHP 2630"`, `"CS I 0190"` and
   `"CSCI 1.50"`. We also return `malformed` for names with text after the digits, which the
   spec says to ignore.
2. **(Done Nov 12–13.) Irrelevant courses are counted as unnecessary.** Most of the 81 tests
   (57 strong) that expect `all-necessary` while we return `has-unnecessary`. Examples are
   `[list: "HIST 0150"]`, `"MATH 9999"`, `"PHP  0060"` and suffixed codes like `"CSCI 0190A"`.
   We also fail to recognize `"PHP  2630"` as an approved outside course.
3. **(Done Nov 13.) Redundancy inside a pick-one group is missed.** 56 tests
   (29 strong) expect `has-unnecessary` and we return `all-necessary`. The core cases are
   `MATH 0100` with `MATH 0170`, and `CSCI 0300` with `CSCI 0330`.
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
- [x] The Series C extra course (Nov 13, Luke): any CSCI course numbered 200 or above that no
      other requirement uses. The Bulletin's "may be CSCI 0200, a Foundations course, or a
      1000-level course" gives examples, not a complete list. So CSCI 0220 can be the extra
      while MATH 1530 is the math foundation, CSCI 0320 and unlisted courses like CSCI 0530 can
      be it, 2000-level courses can be it (as for technical electives, Ed #786: "If those
      2000-level courses are also Technical, then yes."), and it needn't be technical, so a 4th
      non-technical course can be it. Evidence: suite-B 291, 296; suite-O 71, 107, 144, 172,
      195 (0220 as the extra): 9 to 12 of 17; suite-C 69 (0530 as the extra): 11 of 17. Courses
      numbered 3000 and up are still the separate open item below.
- [x] Non-technical CSCI courses (Nov 12, from the Bulletin table): none can fill a technical
      slot (footnote 3: "None of these can be CS non-technical courses"), and at most 3 can fill
      additional slots ("no more than three non-technical courses"). So
      `[list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1370"] is has-unnecessary`.
- [x] Exclusive pairs (Nov 13, Luke: "if i missed something from the handbook, the handbook
      should be right"): the Handbook's approved outside list, which the Bulletin defers to ("see
      the concentration handbook for the current list"), says "cannot use both ENGN 2520 and
      CSCI 1420", "DATA 1340/EEPS 1340 (cannot use DATA 1340 and CSCI 1951A)" and "EEPS 1340
      (formerly 1960D; cannot use both EEPS 1340 and CSCI 1951A)". Only one course of each pair
      counts, and suffixes are ignored (Ed #257), so CSCI 1951I counts as CSCI 1951A. DATA 1340
      and EEPS 1340 are different courses (different departments) and both count, so
      `[list: "DATA 1340", "EEPS 1340"] is all-necessary`. Majority: ENGN 2520 with CSCI 1420
      split 8 to 9; DATA 1340 with CSCI 1951A got 4 of 17, EEPS 1340 with CSCI 1951 5 of 17;
      DATA 1340 with EEPS 1340 (expecting `has-unnecessary`) 4 of 17.
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
- [x] Two names that are the same course once trimmed (`"CSCI 2951A"`, `"CSCI 2951B"`) merge
      into one course that counts once and is never unnecessary (Nov 13, Luke, from Ed #257:
      "Count it only once. Once the suffixes disappear, all the courses merge into one (in our
      model, not in reality)."). This replaces the Nov 12 decision to treat them as one course
      listed twice and write no tests. Suite-M 222 (10 of 17), 228, 231 and 422 (11 of 17)
      expect `all-necessary`. It also means `"CSCI 1970A"` and `"CSCI 1970B"` are one use of
      CSCI 1970.
- [x] Only one of CSCI 0300 and CSCI 0330 counts anywhere in the concentration, so the other
      can't be the Series C extra course (Nov 13, Luke). Bulletin systems row: "Concentration
      credit for only one of 300/330"; the slot holds one course anyway, so the phrase only
      matters outside it. So `[list: "CSCI 0190", "CSCI 0300", "CSCI 0330"] is has-unnecessary`
      (suite-C line 101: 10 of 17; suite-R line 80: 9 of 17). Suite-N line 153, which completes
      only if 0330 is the extra, passed on 6 of 17.
- [x] (Nov 13, Luke: the cap "refers to cs technical", so it counts only CSCI non-technical
      courses, as the code does; `[list: "CSCI 1800", "CSCI 1805", "APMA 1910", "IAPA 1801"]
      is all-necessary`.) Do non-CS non-technical courses count toward the cap of three?
      Bulletin: "1000-level and 2000-level CSCI courses (no more than three non-technical
      courses as defined in concentration handbook)". The Handbook caps "these" designated
      courses "towards CS ScB
      requirements" (3 since 2024), and its list includes APMA 1910, DEVL 1810, IAPA 1701A,
      IAPA 1801 and PLCY 1702X, plus "ENGN 1800/1931J (counts as an arts/humanities/policy
      course)". So the text reads as one shared cap. Most implementations count only CSCI
      courses, as our code does: suite-E line 156 (`CSCI 1800`, `CSCI 1805`, `APMA 1910`,
      `IAPA 1801` is has-unnecessary) passed on 3 of 17, suite-H line 205 on 4, suite-Q line 232
      on 3. Ed #711 doesn't settle it. If shared: add ENGN 1800, and the suffix rule would make
      the trimmed IAPA 1701, IAPA 1801, PLCY 1702 and ENGN 1931 technical. Luke may ask on Ed.
- [x] (Nov 13, Luke: yes, as the code does.) Can CSCI 1970 or CSCI 1973 fill a technical
      elective slot? The technical row asks for
      "Five CSCI courses at the 1000 level", and footnote 3 excludes only non-technical courses.
      But the additional electives row lists "CSCI 1970 Individual Independent Study, or
      CSCI 1973 Independent Study" (footnote 4: "Up to two uses of CSCI 1970 or CSCI 1973"), and
      the Handbook says 1970 "will count as an additional CS course under our degree
      requirements". Our code lets them be technical (`tech-elec` doesn't exclude them). On
      suite-E line 224, which completes only if CSCI 1970 is technical, 11 of 17 returned
      `completed` and 5 passed its `has-unnecessary`. Until settled, write no tests that depend
      on it (a test built on `exact-completed-roster` can pass only because 1970 or 1973 fills a
      technical slot, as the first `CSCI 1952B` test did on Nov 12). Settled, so tests may now
      depend on it.
- [x] (Nov 13, Luke: yes, like other upper-level CSCI courses, as the code does.) Can CSCI
      courses numbered 3000 or above fill elective slots? They are valid courses (Req 1
      handout: "assume every course listed is a valid one") and can be the Series C extra course
      ("numbered 200 or above"), as our line 111 test uses `CSCI 3000`. But the elective rows
      name only "1000-level and 2000-level CSCI courses". The majority treats them like other
      upper-level CSCI courses: on suite-E line 223, 11 of 17 counted `CSCI 9999` as technical
      (5 said additional only); suite-J line 199 (3000+ as technical) passed on 9 of 17. Our code
      agrees (`cs-at-least` has no upper bound). Until settled, write no tests that depend on it;
      Luke may ask on Ed.
- [x] (Nov 13, Luke: "if no cs 19, we treat those 'random' courses as irrelavant since they
      arent 'redundant'". Without CSCI 0190 on the roster, a CSCI course numbered 200 to 999
      that no requirement names is ignored, so `[list: "CSCI 0999"]` is all-necessary; with
      CSCI 0190 it can be the Series C extra. Named ones (CSCI 0200, 0220, 0300, 0320, 0330,
      0410, 0500) still count. Suite-J 226 now passes; suite-Q 104, 9 of 17, now fails.) Is an
      unlisted CSCI course numbered 200 to 999 (like `CSCI 0999`) unnecessary or ignored when
      the student isn't on Series C? Its only possible slot is the Series C extra ("an
      additional CS course numbered 200 or above"). `concentration-course` counts every CSCI
      course from 200 up, so such a course makes the roster `has-unnecessary`. Suite-J line
      226 expects `all-necessary` for a roster with `CSCI 0999` (and 3000+ courses); 3 of 17
      passed it. Since the Nov 13 Series C decision below, this also covers rosters with no
      intro course: `[list: "CSCI 0999"]` alone is `has-unnecessary`, and suite-Q line 104
      (`CSCI 0340`) passes only because of it. Noticed Nov 13; write no tests that depend on it
      until settled.
- [x] No Series C extra slot before CSCI 0190 (Nov 13, Luke): when a roster has none of CSCI
      0111, 0150, 0170, 0190 and 0200, no course is held for the Series C extra ("CSCI 0190
      ... AND an additional CS course numbered 200 or above not otherwise used to satisfy a
      concentration requirement"). So ten 1000-level CSCI courses with no intro course are
      `has-unnecessary`, as is the Nov 12 example above. Evidence: the Bulletin and handouts
      don't say, and the handout's "not necessary for completion" doesn't say which completion.
      The majority doesn't hold. Ten 1000-level courses: 10 of 17 (suite-B 198, I 175, K 100).
      Four non-technical courses split 8 to 8 (suite-B 123 and 124, I 167, M 388), but on
      suite-P line 172 (the same overflow with CSCI 0150) 7 implementations don't flag it at
      all, so at most 1 or 2 hold. With CSCI 0190, 7 let 0330 be the extra (suite-C 101); with
      no intro course only 1 returns `all-necessary` on `[0500, 0410, 0300, 0330]` (suite-B
      99), so at least 6 use the slot only when 0190 is there. Suite-B's author expects a 4th
      non-technical course to count with 0190 (line 317) but not without it (lines 123, 124).

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
  in another worktree.
- Push only after Luke has reviewed that exact state and said to push. On Nov 12 Claude pushed
  a02c308 before Luke had checked it, and he called that out.
- To change a branch that is checked out in Luke's main checkout (background sessions can't edit
  there): in the main checkout run `git checkout main`, then
  `git worktree add .claude/worktrees/<name> <branch>`, and enter it with EnterWorktree's `path`.
  When done, ExitWorktree with `keep` (`remove` deletes the branch too), then
  `git worktree remove .claude/worktrees/<name>` and `git checkout <branch>` in the main checkout.
  If Luke has uncommitted edits there, save them first (`git diff > $CLAUDE_JOB_DIR/tmp/x.patch`)
  and ask before folding them into a commit.
- Ask Luke questions in plain words, with a concrete example of what each answer would change.
  On Nov 12 he didn't follow a question about whether suffixed names should "count as the base
  course".
- Worktree sessions refuse a compound shell command (`&&`, pipes, `cd`) when they can't check
  that it stays inside the worktree. Split it into plain commands, or write a script to
  `$CLAUDE_JOB_DIR/tmp` and run that.
- Every feedback-report number in this file should come from `scratch/feedback.py`, run before
  and after the change.
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
