# CS 0190 Requirements 2 (Pyret)

Luke (with a partner) is updating our Requirements 1 implementation and test suite based on the
mutual cross-testing feedback. The problem setup is identical to Requirements 1. This assignment
explicitly permits Claude Code, but Luke is responsible for every line and must be able to explain
it, so explain your reasoning and never make a spec-interpretation call on your own.

## Files

The final files must match the Req 2 starter (confirmed by staff on Ed #318). It has three files,
and each starts with `use context essentials2021`:

- `requirements-2-code.arr`: the implementation. It provides
  `check-requirements :: List<String> -> Completion` and may also contain tests of helpers.
- `requirements-2-tests.arr`: tests of `check-requirements` only, never of helpers or other
  implementation details.
- `requirements-2-common.arr`: data bindings, such as test rosters, that both the code file and
  the tests file use.
- `Completion` comes from the course's shared `requirements-2-definitions.arr` on Google Drive.
  In the browser starter, the `shared-gdrive` and `my-gdrive` include lines must stay exactly as
  given.

Locally we use the same three file names, function name and context, but `include file("...")`
in place of the Drive includes, so that `pyret` can run here:

- `reqs-common.arr` stands in for `requirements-2-definitions.arr` and defines the same
  `Completion`. Never modify it, never copy its definitions elsewhere, and never submit it.
- The common file includes `reqs-common.arr`. The code file includes `reqs-common.arr` and the
  common file. The tests file includes `reqs-common.arr`, the code file and the common file. Keep
  the starter's `provide *` and `provide-types *` lines.
- Only the include lines differ from the browser starter. At the end, Luke pastes everything below
  each file's "DO NOT CHANGE" line into the browser starter.

Reference files:

- `context/reqs-1-spec.md`: the Requirements 1 handout. This is the spec; Req 2 keeps the same
  problem setup.
- `context/reqs-2-spec.md`: the Requirements 2 handout.
- `context/bulletin-cs-scb.md`: the CS ScB requirements from the Brown Bulletin. These are the
  source of truth for the requirements themselves.
- `context/handbook.md`: the Concentrator Handbook. Use it only where the Bulletin defers to it,
  and only the rules for the current requirements year, because it also covers older years.
- `context/ed-clarifications.md`: staff answers from Ed. Treat these as part of the spec.
- `context/feedback-impl-10.md`: how our implementation (impl-10) did against 18 suites. Its tests
  call our old function name, `check-reqs`.
- `context/feedback-suite-P.md`: how our suite (suite-P) did against 18 implementations.
- `scratch/`: local experiments only. Nothing here is submitted.
- `context/<starter folder>/`: the three Req 2 browser starter files. Copy their top sections
  (above "DO NOT CHANGE") exactly, except swap the Drive includes for local `include file(...)`.

Run tests with `pyret requirements-2-tests.arr` (pyret-npm). If the CLI rejects something, tell
Luke instead of working around it in the lines above "DO NOT CHANGE".

## First task: switch to the Req 2 layout

Our Req 1 files are `check-reqs.arr`, `tests.arr` and `reqs-common.arr`. The function is named
`check-reqs` and the files use `use context starter2024`. Before any other work:

1. `git mv check-reqs.arr requirements-2-code.arr`, `git mv tests.arr requirements-2-tests.arr`,
   and create `requirements-2-common.arr` from the starter's shape.
2. Rename `check-reqs` to `check-requirements` everywhere, including every test call.
3. Switch each of the three files to `use context essentials2021` and set up the includes as
   described under Files.
4. Run the tests. Everything that passed before should still pass. If the context change breaks
   something, explain what broke and why before fixing it.
5. Change no behavior in this step. Show Luke the diff and stop.

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

- All 15 tests that at least half the implementations failed (lines 90 to 132) are built on
  `exact-completed-roster`, which lists `"CSCI 1970"` twice (line 119 lists `"CSCI 1973"` twice).
  That input is outside the spec. Line 117 uses `1970` and `1973` and passes on 15 of the 16
  implementations that ran. Rebuild the fixtures with distinct courses, including
  `exact-completed-roster-cs19` and the `missing-*` rosters, and keep the derived tests.
- The suite never caught impl-10's two biggest bugs (clusters 1 and 2). Add tests for clusters 1
  to 4, written by us rather than copied from other suites.

## Decisions log (Luke fills these in; Claude never decides them)

Each line notes how the other implementations split.

- [ ] Can MATH 1530 count as an additional elective when CSCI 0220 is the math foundation?
      `[list: "CSCI 0220", "MATH 1530"] is all-necessary`: 13 of 17 agree.
- [ ] On the CSCI 0190 path, what fills the extra-course slot? Can CSCI 0220 fill it while
      MATH 1530 is the math foundation? Suites B, O, Q and R split around 10 to 12 of 17.
- [ ] Is there a cap of 3 non-technical CSCI courses? `[list: "CSCI 1250", "CSCI 1280",
      "CSCI 1360", "CSCI 1370"] is has-unnecessary` split 8 to 8.
- [ ] Which pairs are mutually exclusive? ENGN 2520 with CSCI 1420 split 8 to 9; DATA 1340 with
      CSCI 1951A got 4 of 17; EEPS 1340 with DATA 1340 got 4 of 17.
- [ ] Can 2000-level CSCI courses be technical electives, or only additional electives? (4 to 5
      of 17 said additional only.)
- [ ] There are 5 technical and 4 additional elective slots. Is a tenth 1000-level CSCI course
      unnecessary? (10 of 17 said yes.)
- [ ] Is there a cap on approved outside (non-CSCI) electives, and what is it?

## How to work with Luke

- Before changing any behavior that rests on an interpretation, quote the spec or Bulletin line it
  depends on. If the decisions log doesn't settle the question, stop and ask.
- Don't make a feedback test pass just because most implementations pass it. Majority is evidence,
  not truth.
- Write tests first: add a test that captures the rule and fails on the current code, then change
  the implementation.
- Work on one cluster at a time and keep diffs small. After each change, explain in a few
  sentences what changed and why.
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
  - Use UpperCamelCase for types and lower-kebab-case for everything else.
- **Readability:**
  - Every function has a `doc:` purpose statement saying what it does, not how, and it isn't
    overly long.
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
  tests in `requirements-2-code.arr` that cover the edge cases the code depends on.
- **Allowed:** the core language, higher-order functions, our own data definitions, and the
  Number, String and Boolean builtins. The allowed libraries are lists, sets, pick, tables, option
  and either. Nothing else.
- **Not allowed:** `var`, `:=`, `ref` and `!`.
