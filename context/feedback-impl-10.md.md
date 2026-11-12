# Implementation report for GEJ4-FER2 and XYG7-BUG1

This is the implementation labelled `impl-10` in the overall results. It was run against 18 test suites, labelled `suite-A` to `suite-R`.

- 1378 tests in all.
- 1120 passed.
- 258 failed; each is listed below with what your implementation did and how the other 17 implementations did on the same test.
- 0 gave no result.

## Results by suite

| Suite | Tests | Passed | Failed | No result | Note |
|---|---|---|---|---|---|
| suite-A | 99 | 80 | 19 | 0 |  |
| suite-B | 123 | 94 | 29 | 0 |  |
| suite-C | 68 | 56 | 12 | 0 |  |
| suite-D | 32 | 30 | 2 | 0 |  |
| suite-E | 114 | 90 | 24 | 0 |  |
| suite-F | 78 | 72 | 6 | 0 |  |
| suite-G | 60 | 54 | 6 | 0 |  |
| suite-H | 47 | 41 | 6 | 0 |  |
| suite-I | 86 | 72 | 14 | 0 |  |
| suite-J | 57 | 39 | 18 | 0 |  |
| suite-K | 48 | 37 | 11 | 0 |  |
| suite-L | 60 | 31 | 29 | 0 |  |
| suite-M | 167 | 147 | 20 | 0 |  |
| suite-N | 102 | 95 | 7 | 0 |  |
| suite-O | 57 | 35 | 22 | 0 |  |
| suite-P | 58 | 58 | 0 | 0 |  |
| suite-Q | 61 | 40 | 21 | 0 |  |
| suite-R | 61 | 49 | 12 | 0 |  |

## How the other implementations did on the tests your implementation failed

Each row counts the tests your implementation failed that a given number of the other 17 implementations passed. A test that most others pass suggests a mistake in your implementation, while one that most others also fail *may* be a buggy test (or a particularly clever one!).

| Other implementations that passed | Tests your impl failed | |
|---|---|---|
| 17 of 17 | 25 | █████████████ |
| 16 of 17 | 14 | ███████ |
| 15 of 17 | 47 | ████████████████████████ |
| 14 of 17 | 25 | █████████████ |
| 13 of 17 | 26 | █████████████ |
| 12 of 17 | 12 | ██████ |
| 11 of 17 | 15 | ████████ |
| 10 of 17 | 16 | ████████ |
| 9 of 17 | 10 | █████ |
| 8 of 17 | 8 | ████ |
| 7 of 17 | 6 | ███ |
| 6 of 17 | 2 | █ |
| 5 of 17 | 4 | ██ |
| 4 of 17 | 11 | ██████ |
| 3 of 17 | 22 | ███████████ |
| 2 of 17 | 1 | █ |
| 1 of 17 | 14 | ███████ |

Each █ stands for up to 2 tests.

## Failed tests

In the order of the table above: the tests that the most other implementations passed come first.

### Passed by 17 of the other 17 implementations: 25 tests

**suite-A, line 145** (check block: malformed course names are flagged)

```
check-reqs([list: "C5CI 0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-A, line 223** (check block: more malformed course names)

```
check-reqs([list: "CSCI-0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-A, line 224** (check block: more malformed course names)

```
check-reqs([list: "1234 0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-B, line 11** (check block: department casing and character validity)

```
check-reqs([list: "CS19 0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-B, line 27** (check block: spacing requirements between department and course number)

```
check-reqs([list: "CSCI\t0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-B, line 44** (check block: arbitrary, empty, and invalid delimiter strings)

```
check-reqs([list: "123456789"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-B, line 45** (check block: arbitrary, empty, and invalid delimiter strings)

```
check-reqs([list: "CSCI-0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-C, line 130, iteration 4 of 9** (check block: malformed course names take priority even on a completed roster)

```
check-reqs([list: course]) is malformed
```

Input:

```
[list: "CSC1 0190"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-E, line 38** (check block: malformed input)

```
check-reqs([list: "CSCI-0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-E, line 58** (check block: well-formed input that looks unusual)

```
check-reqs([list: "PHP  2630"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-F, line 198** (check block: malformed: badly formed course names)

```
check-reqs([list: "CSCI-0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-F, line 203** (check block: malformed: badly formed course names)

```
check-reqs([list: "CS12 0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-G, line 32** (check block: malformed: non-alphabetic dept)

```
check-reqs([list: "1234 5678"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-I, line 57** (check block: check-block-1)

```
check-reqs([list: "C5CI 0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-I, line 64** (check block: check-block-2)

```
check-reqs([list: "CSCI_0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-I, line 110** (check block: check-block-7)

```
check-reqs([list: "PHP  2630"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-J, line 39** (check block: malformed cases)

```
check-reqs([list: "C9CI 0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-J, line 236** (check block: more malformed)

```
check-reqs([list: "CSCI-1000"]) is malformed
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-J, line 239** (check block: more malformed)

```
check-reqs([list: "CS1I 1000"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-J, line 240** (check block: more malformed)

```
check-reqs([list: "CS I-1000"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-N, line 36, iteration 4 of 10** (check block: each kind of malformed code is flagged)

```
check-reqs([list: code]) is malformed
```

Input:

```
[list: "CSCI-0190"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-O, line 24** (check block: malformed input: the first 4 characters should contain A-Z or a space at 4th character)

```
check-reqs([list: "CSC0 0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-O, line 27** (check block: malformed input: the first 4 characters should contain A-Z or a space at 4th character)

```
check-reqs([list: "1234 0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-O, line 41** (check block: malformed input: the 5th character should be a space)

```
check-reqs([list: "CSCI00190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

**suite-O, line 42** (check block: malformed input: the 5th character should be a space)

```
check-reqs([list: "CSCI#0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 17 passed this test, 0 failed it.

### Passed by 16 of the other 17 implementations: 14 tests

**suite-B, line 9** (check block: department casing and character validity)

```
check-reqs([list: "CS-I 0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 16 passed this test, 1 failed it. Those that failed: 1 returned `all-necessary`.

**suite-B, line 10** (check block: department casing and character validity)

```
check-reqs([list: "CS_I 0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 16 passed this test, 1 failed it. Those that failed: 1 returned `all-necessary`.

**suite-B, line 12** (check block: department casing and character validity)

```
check-reqs([list: "CS@# 0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 16 passed this test, 1 failed it. Those that failed: 1 returned `all-necessary`.

**suite-B, line 99** (check block: foundations areas requirements)

```
check-reqs([list: "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 0330"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 16 passed this test, 1 failed it. Those that failed: 1 returned `all-necessary`.

**suite-E, line 45** (check block: malformed input)

```
check-reqs([list: " PHP 2630"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 16 passed this test, 1 failed it. Those that failed: 1 returned `all-necessary`.

**suite-I, line 58** (check block: check-block-1)

```
check-reqs([list: "CS I 0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 16 passed this test, 1 failed it. Those that failed: 1 returned `all-necessary`.

**suite-J, line 52** (check block: malformed cases)

```
check-reqs([list: "PHP 00200"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 16 passed this test, 1 failed it. Those that failed: 1 returned `all-necessary`.

**suite-K, line 118** (check block: malformed)

```
check-reqs([list: "!@#$ 0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 16 passed this test, 1 failed it. Those that failed: 1 returned `all-necessary`.

**suite-M, line 292** (check block: check-reqs unpadded three-letter department names)

```
check-reqs([list: " PHP 0060"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 16 passed this test, 1 failed it. Those that failed: 1 returned `all-necessary`.

**suite-M, line 293** (check block: check-reqs unpadded three-letter department names)

```
check-reqs([list: "P HP 0060"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 16 passed this test, 1 failed it. Those that failed: 1 returned `all-necessary`.

**suite-M, line 294** (check block: check-reqs unpadded three-letter department names)

```
check-reqs([list: "PH P 0060"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 16 passed this test, 1 failed it. Those that failed: 1 returned `all-necessary`.

**suite-O, line 25** (check block: malformed input: the first 4 characters should contain A-Z or a space at 4th character)

```
check-reqs([list: "CS#I 0190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 16 passed this test, 1 failed it. Those that failed: 1 returned `all-necessary`.

**suite-Q, line 75** (check block: check-reqs returns malformed when input is malformed)

```
check-reqs([list: "CSCI 0190", "CSCI 1000", "CSCI 0220",
    "CSCI 0300", " PHP 1234", "CSCI 0330", "MATH 1000"])
  is malformed # dept name should be "PHP " not " PHP"
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 16 passed this test, 1 failed it. Those that failed: 1 returned `has-unnecessary`.

**suite-Q, line 91** (check block: check-reqs returns malformed when input is malformed)

```
check-reqs([list: "CSCI 0190", "CS#I 0320", "CSCI 0222",
    "CSCI 0300", "CSCI 0410", "CSCI 0330", "MATH 1000"])
  is malformed # symbol in CS#I 0320
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 16 passed this test, 1 failed it. Those that failed: 1 returned `has-unnecessary`.

### Passed by 15 of the other 17 implementations: 47 tests

**suite-A, line 49** (check block: courses outside the concentration are ignored)

```
check-reqs([list: "HIST 0150", "ENGL 0200", "BIOL 0200"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-A, line 50** (check block: courses outside the concentration are ignored)

```
check-reqs([list: "CSCI 0150", "HIST 0150", "CSCI 0200"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-A, line 92** (check block: the four additional electives can come from every allowed source)

```
check-reqs(build-roster(series-a-intro, five-technical,
    [list: "PHP  1855", "APMA 1080", "APMA 1160", "CSCI 0320"])) is completed
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "MATH 0100", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1230", "CSCI 1260", "CSCI 1270", "CSCI 1310", "CSCI 1380", "PHP  1855", "APMA 1080",
  "APMA 1160", "CSCI 0320"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 1 failed it, 1 gave no result. Those that failed: 1 returned `all-necessary`.

**suite-A, line 106** (check block: only one course from each 'pick one' group counts toward concentration credit)

```
check-reqs([list: "MATH 0100", "MATH 0170"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `all-necessary`.

**suite-A, line 107** (check block: only one course from each 'pick one' group counts toward concentration credit)

```
check-reqs([list: "CSCI 0300", "CSCI 0330"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `all-necessary`.

**suite-B, line 78** (check block: math prerequisite requirements)

```
check-reqs([list: "MATH 0100", "MATH 0170"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `all-necessary`.

**suite-B, line 80** (check block: math prerequisite requirements)

```
check-reqs([list: "MATH 9999"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-B, line 98** (check block: foundations areas requirements)

```
check-reqs([list: "CSCI 0300", "CSCI 0330"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `all-necessary`.

**suite-B, line 101** (check block: foundations areas requirements)

```
check-reqs([list: "CSCI 0500", "CSCI 0410", "CSCI 0300", "HIST 9999", "ABCD 0123"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-B, line 103** (check block: foundations areas requirements)

```
check-reqs([list: "ABCD 0123", "EFGH 4567"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-C, line 30** (check block: empty rosters and unrelated courses are harmless)

```
check-reqs([list: "CSCI 0190", "CSCI 0200", "HIST 1000"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-D, line 38** (check block: check-reqs: unnecessary courses)

```
check-reqs([list: "MATH 0100", "MATH 0170"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `all-necessary`.

**suite-D, line 40** (check block: check-reqs: unnecessary courses)

```
check-reqs([list: "CSCI 0300", "CSCI 0330"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `all-necessary`.

**suite-E, line 66** (check block: nothing taken yet / only unrelated courses)

```
check-reqs([list: "ENGL 0100", "HIST 0150", "VISA 1240"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-E, line 73** (check block: calculus all necessary)

```
check-reqs([list: "MATH 0100", "ENGL 0100"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-E, line 77** (check block: calculus with has-unnecessary)

```
check-reqs([list: "MATH 0100", "MATH 0170"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `all-necessary`.

**suite-E, line 89** (check block: intro sequences all necessary)

```
check-reqs([list: "CSCI 0150", "CSCI 0200", "ENGL 0100"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-E, line 105** (check block: intro math foundations all necessary)

```
check-reqs([list: "CSCI 0220", "ENGL 0100"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-E, line 117** (check block: algorithms/theory foundations all necessary)

```
check-reqs([list: "CSCI 0500", "ENGL 0100"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-E, line 122** (check block: AI/machine learning/data science foundations all necessary)

```
check-reqs([list: "CSCI 0410", "ENGL 0100"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-E, line 128** (check block: systems foundations all necessary)

```
check-reqs([list: "CSCI 0300", "ENGL 0100"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-E, line 132** (check block: systems foundations with has-unnecessary)

```
check-reqs([list: "CSCI 0300", "CSCI 0330"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `all-necessary`.

**suite-F, line 160** (check block: has-unnecessary: extra calculus, systems, and linear algebra courses)

```
check-reqs([list: "MATH 0100", "MATH 0170"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 15 passed this test, 1 failed it, 1 gave no result. Those that failed: 1 returned `all-necessary`.

**suite-G, line 308** (check block: irrelevant courses are ignored)

```
check-reqs([list: "HIST 0100", "ENGL 0200", "PHYS 0030"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-G, line 312** (check block: mix of relevant and irrelevant)

```
check-reqs([list: "CSCI 0150", "CSCI 0200", "ENGL 0100",
    "HIST 0100", "CSCI 0220"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-I, line 72** (check block: check-block-3)

```
check-reqs([list: "CSCI -190"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 1 raised an exception: "course is malformed and bypassed malform checks"; 1 returned `all-necessary`.

**suite-I, line 73** (check block: check-block-3)

```
check-reqs([list: "CSCI 1.50"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `all-necessary`.

**suite-I, line 140** (check block: check-block-11)

```
check-reqs([list: "CSCI 0300", "CSCI 0330"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `all-necessary`.

**suite-I, line 205** (check block: check-block-17)

```
check-reqs(base.append([list: "MATH 0540", "APMA 1650", "CLPS 1211", "PHP  2630"]))
  is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1230", "CSCI 1270", "CSCI 1380", "CSCI 1470", "CSCI 1570", "MATH 0540", "APMA 1650",
  "CLPS 1211", "PHP  2630"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 1 failed it, 1 gave no result. Those that failed: 1 returned `all-necessary`.

**suite-J, line 17** (check block: math)

```
check-reqs([list: "MATH 0100", "MATH 0190"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `all-necessary`.

**suite-J, line 18** (check block: math)

```
check-reqs([list: "MATH 0170", "MATH 0190"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `all-necessary`.

**suite-J, line 34** (check block: foundations)

```
check-reqs([list: "CSCI 0300", "CSCI 0330"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `all-necessary`.

**suite-K, line 31** (check block: pre-requisites)

```
check-reqs([list: "MATH 0170", "MATH 0190"])
  is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `all-necessary`.

**suite-K, line 53** (check block: foundation areas)

```
check-reqs([list: "CSCI 0300", "CSCI 0330"])
  is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `all-necessary`.

**suite-K, line 119** (check block: malformed)

```
check-reqs([list: "CSCI 0190S"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 1 returned `has-unnecessary`; 1 returned `malformed`.

**suite-M, line 76** (check block: check-reqs empty and only non-concentration course rosters)

```
check-reqs([list: "ENGL 0101", "DATA 0150", "ANTH 0100"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-M, line 78** (check block: check-reqs empty and only non-concentration course rosters)

```
check-reqs([list: "BIOL 0200"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-M, line 79** (check block: check-reqs empty and only non-concentration course rosters)

```
check-reqs([list: "ECON 1130", "ARCH 1773"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-M, line 118** (check block: check-reqs foundations courses)

```
check-reqs([list: "CSCI 0300", "CSCI 0330"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `all-necessary`.

**suite-O, line 127** (check block: checking if wrong greedy solution (local optimal but not global optimal): a fourth 
  outside course, and 1650 with 1655, are unnecessary)

```
check-reqs([list: "CSCI 0300", "CSCI 0330"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `all-necessary`.

**suite-O, line 177** (check block: non-concentration courses are ignored)

```
check-reqs([list: "PHIL 0100"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-O, line 178** (check block: non-concentration courses are ignored)

```
check-reqs([list: "CSCI 0190", "PHIL 0100"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-O, line 191** (check block: MATH 2000+ is not relevant to CS concentration)

```
check-reqs([list: "MATH 2001"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-Q, line 87** (check block: check-reqs returns malformed when input is malformed)

```
check-reqs([list: "CSCI 0190", "CSCI 0320", "CSCI 02.2",
    "CSCI 0300", "CSCI 0410", "CSCI 0330", "MATH 1000"])
  is malformed # decimal point in "CSCI 02.2"
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-Q, line 107** (check block: check-reqs does not return malformed if input is well formed)

```
check-reqs([list: "PHP  0190", "CSCI 2340", "CSCI 0300",
    "CSCI 0220", "CSCI 0410"])
  is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-R, line 156** (check block: non-concentration courses are ignored)

```
check-reqs(ignored-roster) is all-necessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0220", "CSCI 0500", "EEPS 0050"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

**suite-R, line 157** (check block: non-concentration courses are ignored)

```
check-reqs([list: "HIST 0150", "ECON 0110"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 15 passed this test, 2 failed it. Those that failed: 2 returned `has-unnecessary`.

### Passed by 14 of the other 17 implementations: 25 tests

**suite-A, line 51** (check block: courses outside the concentration are ignored)

```
check-reqs([list: "PHP  0060"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 14 passed this test, 3 failed it. Those that failed: 3 returned `has-unnecessary`.

**suite-A, line 123** (check block: course suffixes are ignored)

```
check-reqs([list: "CSCI 0190A", "CSCI 0200"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 14 passed this test, 2 failed it, 1 gave no result. Those that failed: 1 returned `has-unnecessary`; 1 returned `malformed`.

**suite-A, line 183** (check block: a nearly complete roster with a misplaced course is has-unnecessary)

```
check-reqs(swap-course(complete-series-a, "CSCI 0220", "MATH 0170")) is has-unnecessary
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "MATH 0100", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230",
  "CSCI 1260", "CSCI 1270", "CSCI 1310", "CSCI 1380", "CSCI 1430", "CSCI 1470", "CSCI 1600",
  "CSCI 1680", "MATH 0170"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 14 passed this test, 1 failed it, 2 gave no result. Those that failed: 1 returned `all-necessary`.

**suite-A, line 199** (check block: linear algebra and 1000-level math can fill an additional elective)

```
check-reqs(swap-course(complete-series-a, "CSCI 1680", "MATH 1010")) is completed
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "MATH 0100", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1230", "CSCI 1260", "CSCI 1270", "CSCI 1310", "CSCI 1380", "CSCI 1430", "CSCI 1470",
  "CSCI 1600", "MATH 1010"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 14 passed this test, 2 failed it, 1 gave no result. Those that failed: 2 returned `all-necessary`.

**suite-B, line 88** (check block: introductory math foundations requirements)

```
check-reqs([list: "MATH 0000"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 14 passed this test, 3 failed it. Those that failed: 2 returned `has-unnecessary`; 1 returned `malformed`.

**suite-E, line 171** (check block: all requirements completed (with only necessary courses))

```
check-reqs(test-without(TEST-FULL, TEST-INTRO) + [list: "CSCI 0190", "MATH 1530"])
  is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230", "CSCI 1270",
  "CSCI 1290", "CSCI 1310", "CSCI 1380", "CSCI 0320", "MATH 0520", "APMA 1650", "ECON 1870",
  "CSCI 0190", "MATH 1530"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 14 passed this test, 2 failed it, 1 gave no result. Those that failed: 2 returned `has-unnecessary`.

**suite-F, line 41** (check block: completed: alternative ways to meet requirements)

```
check-reqs([list: "MATH 0100", "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410",
    "CSCI 0300", "CSCI 1230", "CSCI 1270", "CSCI 1310", "CSCI 1420", "CSCI 1430",
    "CSCI 0320", "MATH 0520", "PHP  2630", "CSCI 1680"]) is completed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 14 passed this test, 2 failed it, 1 gave no result. Those that failed: 2 returned `all-necessary`.

**suite-F, line 161** (check block: has-unnecessary: extra calculus, systems, and linear algebra courses)

```
check-reqs([list: "CSCI 0300", "CSCI 0330"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 14 passed this test, 2 failed it, 1 gave no result. Those that failed: 2 returned `all-necessary`.

**suite-H, line 154** (check block: [check-reqs] returns 'has-unnecessary' when overlapping courses are taken)

```
check-reqs(courses-foundations-1 + get-random-from(courses-overlapping))
  is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 14 passed this test, 1 failed it, 2 gave no result. Those that failed: 1 returned `all-necessary`.

**suite-I, line 88** (check block: edge cases)

```
check-reqs([list: "PHP  0060"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 14 passed this test, 3 failed it. Those that failed: 3 returned `has-unnecessary`.

**suite-I, line 97** (check block: check-block-6)

```
check-reqs(IRRELEVANT) is all-necessary
```

Input:

```
[list: "ENGL 0900", "PHIL 0350", "ECON 0110", "PHP  0060"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 14 passed this test, 3 failed it. Those that failed: 3 returned `has-unnecessary`.

**suite-I, line 98** (check block: check-block-6)

```
check-reqs([list: "CSCI 0150"].append(IRRELEVANT)) is all-necessary
```

Input:

```
[list: "CSCI 0150", "ENGL 0900", "PHIL 0350", "ECON 0110", "PHP  0060"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 14 passed this test, 3 failed it. Those that failed: 3 returned `has-unnecessary`.

**suite-J, line 207** (check block: unnecessary)

```
check-reqs(test-calc) is has-unnecessary
```

Input:

```
[list: "MATH 0100", "MATH 0190"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 14 passed this test, 1 failed it, 2 gave no result. Those that failed: 1 returned `all-necessary`.

**suite-J, line 213** (check block: unnecessary)

```
check-reqs(test-short) is has-unnecessary
```

Input:

```
[list: "MATH 0100", "MATH 0170", "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410",
  "CSCI 0300", "CSCI 1112", "CSCI 2440", "CSCI 3555", "CSCI 4666", "CSCI 1250", "CSCI 1860",
  "APMA 1080", "MATH 0520"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 14 passed this test, 1 failed it, 2 gave no result. Those that failed: 1 returned `all-necessary`.

**suite-K, line 90** (check block: additional cs electives)

```
check-reqs([list: "CSCI 0300", "CSCI 0330"])
  is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 14 passed this test, 2 failed it, 1 gave no result. Those that failed: 2 returned `all-necessary`.

**suite-L, line 89** (check block: check-reqs)

```
check-reqs([list: "MATH 0100", "MATH 0170", "CSCI 0150", "CSCI 0200", "CSCI 0220"]
    .append(ft).append(add-short)) is has-unnecessary
```

Input:

```
[list: "MATH 0100", "MATH 0170", "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410",
  "CSCI 0300", "CSCI 1230", "CSCI 1270", "CSCI 1420", "CSCI 1570", "CSCI 1710", "CSCI 0320",
  "MATH 0540", "APMA 1650"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 14 passed this test, 1 failed it, 2 gave no result. Those that failed: 1 returned `all-necessary`.

**suite-M, line 77** (check block: check-reqs empty and only non-concentration course rosters)

```
check-reqs([list: "PHP  0060"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 14 passed this test, 3 failed it. Those that failed: 3 returned `has-unnecessary`.

**suite-M, line 107** (check block: check-reqs introductory math foundations)

```
check-reqs([list: "CSCI 0190", "CSCI 0220", "MATH 1530"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 14 passed this test, 3 failed it. Those that failed: 2 returned `has-unnecessary`; 1 raised an exception: "unexpected input".

**suite-N, line 51** (check block: suffixes and padded departments are well-formed)

```
check-reqs([list: "PHP  0060"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 14 passed this test, 3 failed it. Those that failed: 3 returned `has-unnecessary`.

**suite-N, line 61** (check block: courses outside the concentration are ignored)

```
check-reqs([list: "PHYS 0050", "ENGL 0100"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 14 passed this test, 2 failed it, 1 gave no result. Those that failed: 2 returned `has-unnecessary`.

**suite-N, line 62** (check block: courses outside the concentration are ignored)

```
check-reqs(link("PHYS 0050", SERIES-A)) is all-necessary
```

Input:

```
[list: "PHYS 0050", "CSCI 0150", "CSCI 0200"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 14 passed this test, 2 failed it, 1 gave no result. Those that failed: 2 returned `has-unnecessary`.

**suite-Q, line 488** (check block: check-reqs prioritizes completed over has-unnecessary)

```
check-reqs(EXTRA-MATH-HAS-UNNECESSARY) is has-unnecessary
```

Input:

```
[list: "MATH 0170", "MATH 0100", "CSCI 0190", "CSCI 0200", "CSCI 0300", "CSCI 0410", "CSCI 0220",
  "CSCI 0320", "CSCI 1250", "CSCI 1000", "CSCI 1111", "CSCI 2222", "CSCI 2145", "CSCI 2220",
  "CSCI 1234", "CSCI 1443"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 14 passed this test, 1 failed it, 2 gave no result. Those that failed: 1 returned `all-necessary`.

**suite-R, line 106** (check block: not completed, but has unnecessary courses)

```
check-reqs(double-calc-roster) is has-unnecessary
```

Input:

```
[list: "MATH 0100", "MATH 0190", "CSCI 0150"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 14 passed this test, 2 failed it, 1 gave no result. Those that failed: 2 returned `all-necessary`.

**suite-R, line 110** (check block: has-unnecessary - taking both 0330 and 0300)

```
check-reqs([list: "CSCI 0300", "CSCI 0330"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 14 passed this test, 2 failed it, 1 gave no result. Those that failed: 2 returned `all-necessary`.

**suite-R, line 162** (check block: three letter department names)

```
check-reqs(remove(perf-roster, "MATH 0540") + [list: "PHP  2630"]) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1999", "CSCI 1998", "CSCI 1997", "CSCI 1996", "CSCI 1995", "CSCI 1970", "CSCI 1973",
  "CSCI 0320", "PHP  2630"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 14 passed this test, 2 failed it, 1 gave no result. Those that failed: 2 returned `all-necessary`.

### Passed by 13 of the other 17 implementations: 26 tests

**suite-A, line 128** (check block: suffixed versions of one course count as a single course)

```
check-reqs(two-short.append([list: "CSCI 1230A", "CSCI 1230B"])) is-not completed
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "MATH 0100", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1260", "CSCI 1270", "CSCI 1310", "CSCI 1380", "CSCI 1470", "CSCI 1600", "CSCI 1680",
  "CSCI 1230A", "CSCI 1230B"]
```

Your implementation returned `completed`, which the test rules out.

Of the other 17 implementations: 13 passed this test, 2 failed it, 2 gave no result. Those that failed: 2 returned `completed`, which the test rules out.

**suite-A, line 190** (check block: course-level boundaries for CSCI electives)

```
check-reqs(swap-course(complete-series-a, "CSCI 1680", "HIST 1000")) is all-necessary
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "MATH 0100", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1230", "CSCI 1260", "CSCI 1270", "CSCI 1310", "CSCI 1380", "CSCI 1430", "CSCI 1470",
  "CSCI 1600", "HIST 1000"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 2 failed it, 2 gave no result. Those that failed: 2 returned `has-unnecessary`.

**suite-A, line 202** (check block: a course the department has denied does not count)

```
check-reqs(swap-course(complete-series-a, "CSCI 1680", "APMA 1920")) is all-necessary
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "MATH 0100", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1230", "CSCI 1260", "CSCI 1270", "CSCI 1310", "CSCI 1380", "CSCI 1430", "CSCI 1470",
  "CSCI 1600", "APMA 1920"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 2 failed it, 2 gave no result. Those that failed: 2 returned `has-unnecessary`.

**suite-B, line 84** (check block: introductory math foundations requirements)

```
check-reqs([list: "CSCI 0220", "MATH 1530"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 4 failed it. Those that failed: 4 returned `has-unnecessary`.

**suite-C, line 71** (check block: the accelerated extra course cannot also fill another requirement)

```
check-reqs([list: "CSCI 0190", "CSCI 0220", "MATH 1530"] +
  without-course(test-core, "CSCI 0220") + [list: "MATH 0100"]) is completed
```

Input:

```
[list: "CSCI 0190", "CSCI 0220", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230",
  "CSCI 1260", "CSCI 1270", "CSCI 1310", "CSCI 1510", "CSCI 0320", "MATH 0520", "APMA 1650",
  "CSCI 2000", "MATH 0100"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 2 failed it, 2 gave no result. Those that failed: 2 returned `has-unnecessary`.

**suite-C, line 110** (check block: approved outside courses, suffixes, and independent study)

```
check-reqs([list: "PHP  2630", "APMA 2822B", "PHYS 2550"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 2 failed it, 2 gave no result. Those that failed: 1 returned `has-unnecessary`; 1 returned `malformed`.

**suite-C, line 111** (check block: approved outside courses, suffixes, and independent study)

```
check-reqs([list: "MATH 1999", "ARTS 1550", "APMA 1930W"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 2 failed it, 2 gave no result. Those that failed: 1 returned `has-unnecessary`; 1 returned `malformed`.

**suite-E, line 104** (check block: intro math foundations all necessary)

```
check-reqs([list: "CSCI 0220", "MATH 1530"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 4 failed it. Those that failed: 4 returned `has-unnecessary`.

**suite-E, line 143** (check block: electives (technical and other) all necessary)

```
check-reqs(TEST-INTRO + [list: "CSCI 1230", "ENGL 0100"]) is all-necessary
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "CSCI 1230", "ENGL 0100"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 2 failed it, 2 gave no result. Those that failed: 2 returned `has-unnecessary`.

**suite-H, line 141** (check block: [check-reqs] returns 'all-necessary' when no overlapping courses are taken)

```
check-reqs(link("ENGL 0090", remove(roster-basic-cs19, "CSCI 0200")))
  is all-necessary
```

Input:

```
[list: "ENGL 0090", "CSCI 1470", "CSCI 1420", "CSCI 1230", "CSCI 0320", "CSCI 0500", "CSCI 1515",
  "CSCI 0300", "CSCI 1250", "CSCI 0190", "CSCI 0410", "CSCI 1670", "CSCI 0220", "MATH 0520",
  "MATH 0100", "CSCI 1260"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 2 failed it, 2 gave no result. Those that failed: 2 returned `has-unnecessary`.

**suite-H, line 145** (check block: [check-reqs] returns 'all-necessary' when no overlapping courses are taken)

```
check-reqs(shuffle-add-random(non-csci-courses,
    [list: "CSCI 0190", "CSCI 0300", "CSCI 0220"], 5))
  is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 2 failed it, 2 gave no result. Those that failed: 2 returned `has-unnecessary`.

**suite-H, line 186** (check block: [check-reqs] permits (certain) external courses to count toward additional electives)

```
check-reqs(replace(roster-basic-cs15, "MATH 0520", "PHP  2630")) is completed
```

Input:

```
[list: "CSCI 0320", "CSCI 0150", "CSCI 1515", "CSCI 0200", "CSCI 1230", "CSCI 1260", "CSCI 0410",
  "PHP  2630", "CSCI 0300", "CSCI 1420", "CSCI 1250", "CSCI 1670", "CSCI 0220", "CSCI 0500",
  "MATH 0100", "CSCI 1470"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 2 failed it, 2 gave no result. Those that failed: 2 returned `all-necessary`.

**suite-I, line 141** (check block: check-block-11)

```
check-reqs([list: "CSCI 0220", "MATH 1530"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 4 failed it. Those that failed: 4 returned `has-unnecessary`.

**suite-J, line 211** (check block: unnecessary)

```
check-reqs(test-systems) is has-unnecessary
```

Input:

```
[list: "CSCI 0300", "CSCI 0330"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 13 passed this test, 2 failed it, 2 gave no result. Those that failed: 2 returned `all-necessary`.

**suite-K, line 40** (check block: intro math)

```
check-reqs([list: "CSCI 0220", "MATH 1530"])
  is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 4 failed it. Those that failed: 4 returned `has-unnecessary`.

**suite-K, line 120** (check block: malformed)

```
check-reqs([list: "CSCI 0190-S"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 4 failed it. Those that failed: 3 returned `malformed`; 1 returned `has-unnecessary`.

**suite-L, line 24** (check block: check-reqs)

```
check-reqs([list: "CSCI 45/3"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 2 failed it, 2 gave no result. Those that failed: 2 returned `all-necessary`.

**suite-L, line 77** (check block: check-reqs)

```
check-reqs([list: "ECON 0110", "CSCI 0150", "CSCI 0200", "CSCI 0220"]
    .append(ft).append(add-short)) is all-necessary
```

Input:

```
[list: "ECON 0110", "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1230", "CSCI 1270", "CSCI 1420", "CSCI 1570", "CSCI 1710", "CSCI 0320", "MATH 0540",
  "APMA 1650"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 2 failed it, 2 gave no result. Those that failed: 2 returned `has-unnecessary`.

**suite-M, line 106** (check block: check-reqs introductory math foundations)

```
check-reqs([list: "CSCI 0220", "MATH 1530"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 4 failed it. Those that failed: 4 returned `has-unnecessary`.

**suite-M, line 108** (check block: check-reqs introductory math foundations)

```
check-reqs([list: "CSCI 0111", "CSCI 0220", "MATH 1530"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 4 failed it. Those that failed: 4 returned `has-unnecessary`.

**suite-N, line 128** (check block: MATH 1530 can be an elective when CSCI 0220 is the math foundation)

```
check-reqs([list: "CSCI 0150", "CSCI 0200", "CSCI 0220", "MATH 1530"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 4 failed it. Those that failed: 4 returned `has-unnecessary`.

**suite-N, line 163** (check block: series C spare and math foundation are filled by different courses)

```
check-reqs(spare-and-algebra) is completed
```

Input:

```
[list: "MATH 1530", "CSCI 0190", "MATH 0100", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1010", "CSCI 1260", "CSCI 1310", "CSCI 1410", "CSCI 1440", "CSCI 0320", "CSCI 1430",
  "MATH 0520", "APMA 1650"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 2 failed it, 2 gave no result. Those that failed: 2 returned `has-unnecessary`.

**suite-Q, line 186** (check block: check-reqs ignores courses not related to CSCI requirements)

```
check-reqs(ALL-NECESSARY-TEST) is all-necessary
```

Input:

```
[list: "HIST 0150", "CSCI 0190", "CSCI 0200", "CSCI 0300", "CSCI 0410", "CSCI 0220", "VISA 0100",
  "CSCI 0500", "MATH 0190", "CSCI 1250", "PLCY 1702", "CSCI 1870", "ECON 1099", "CSCI 1233",
  "CSCI 1240", "CSCI 1400", "MATH 0350", "CSCI 1410", "CSCI 2000"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 2 failed it, 2 gave no result. Those that failed: 2 returned `has-unnecessary`.

**suite-Q, line 187** (check block: check-reqs ignores courses not related to CSCI requirements)

```
check-reqs(IGNORES-MATH-UNDER-THOUSAND-TEST) is all-necessary
```

Input:

```
[list: "HIST 0150", "CSCI 0190", "CSCI 0200", "CSCI 0300", "CSCI 0410", "CSCI 0220", "VISA 0100",
  "CSCI 0500", "MATH 0190", "CSCI 1250", "PLCY 1702", "CSCI 1870", "ECON 1099", "CSCI 1233",
  "CSCI 1240", "CSCI 1400", "MATH 0350", "CSCI 1410", "CSCI 2000", "MATH 0350", "MATH 0450"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 2 failed it, 2 gave no result. Those that failed: 2 returned `has-unnecessary`.

**suite-R, line 87** (check block: cs-19 sequence completed with 0220 or 0320 as the second course, not a 1000-level)

```
check-reqs(slot-open-roster + [list: "MATH 1530"]) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0190", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1999",
  "CSCI 1998", "CSCI 1997", "CSCI 1996", "CSCI 1995", "CSCI 1970", "CSCI 1973", "CSCI 0320",
  "MATH 0540", "MATH 1530"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 2 failed it, 2 gave no result. Those that failed: 2 returned `has-unnecessary`.

**suite-R, line 161** (check block: three letter department names)

```
check-reqs([list: "PHP  0060"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 13 passed this test, 3 failed it, 1 gave no result. Those that failed: 3 returned `has-unnecessary`.

### Passed by 12 of the other 17 implementations: 12 tests

**suite-A, line 198** (check block: linear algebra and 1000-level math can fill an additional elective)

```
check-reqs(swap-course(complete-series-a, "CSCI 1680", "MATH 1530")) is completed
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "MATH 0100", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1230", "CSCI 1260", "CSCI 1270", "CSCI 1310", "CSCI 1380", "CSCI 1430", "CSCI 1470",
  "CSCI 1600", "MATH 1530"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 12 passed this test, 4 failed it, 1 gave no result. Those that failed: 4 returned `has-unnecessary`.

**suite-A, line 215** (check block: suffixes work for departments other than CSCI and for intro courses)

```
check-reqs(build-roster(series-a-intro, five-technical,
    [list: "PHP  1855A", "APMA 1080", "APMA 1160", "CSCI 0320"])) is completed
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "MATH 0100", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1230", "CSCI 1260", "CSCI 1270", "CSCI 1310", "CSCI 1380", "PHP  1855A", "APMA 1080",
  "APMA 1160", "CSCI 0320"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 12 passed this test, 4 failed it, 1 gave no result. Those that failed: 3 returned `all-necessary`; 1 returned `malformed`.

**suite-A, line 217** (check block: suffixes work for departments other than CSCI and for intro courses)

```
check-reqs(swap-course(complete-series-a, "CSCI 0150", "CSCI 0150A")) is completed
```

Input:

```
[list: "CSCI 0200", "MATH 0100", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230",
  "CSCI 1260", "CSCI 1270", "CSCI 1310", "CSCI 1380", "CSCI 1430", "CSCI 1470", "CSCI 1600",
  "CSCI 1680", "CSCI 0150A"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 12 passed this test, 4 failed it, 1 gave no result. Those that failed: 2 returned `all-necessary`; 1 returned `has-unnecessary`; 1 returned `malformed`.

**suite-B, line 296** (check block: math foundations allocation: MATH 1530 needed for math foundations so CSCI 0220 fills the CS19 slot)

```
check-reqs([list:
  "MATH 0100", "CSCI 0190", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "MATH 1530", "CSCI 0220",
  "CSCI 1010", "CSCI 1230", "CSCI 1410", "CSCI 1670", "CSCI 1810",
  "MATH 0520", "APMA 1080", "APMA 1160", "APMA 1690"]) is completed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 12 passed this test, 3 failed it, 2 gave no result. Those that failed: 3 returned `has-unnecessary`.

**suite-B, line 304** (check block: math foundations allocation: CSCI 0200 fills the CS19 slot so MATH 1530 goes to electives)

```
check-reqs([list:
  "MATH 0100", "CSCI 0190", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 0220", "MATH 1530", "CSCI 0200",
  "CSCI 1010", "CSCI 1230", "CSCI 1410", "CSCI 1670", "CSCI 1810",
  "MATH 0520", "APMA 1080", "APMA 1160"]) is completed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 12 passed this test, 4 failed it, 1 gave no result. Those that failed: 4 returned `has-unnecessary`.

**suite-H, line 148** (check block: [check-reqs] returns 'all-necessary' when no overlapping courses are taken)

```
check-reqs(shuffle-add-random(non-csci-courses,
    [list: "CSCI 0150", "CSCI 0200", "CSCI 0300", "MATH 1530", "MATH 0520"], 7))
  is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 12 passed this test, 3 failed it, 2 gave no result. Those that failed: 2 returned `has-unnecessary`; 1 raised an exception: "unexpected input".

**suite-L, line 31** (check block: check-reqs)

```
check-reqs([list: "CSC  1011-T"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 12 passed this test, 3 failed it, 2 gave no result. Those that failed: 1 returned `has-unnecessary`; 2 returned `malformed`.

**suite-M, line 159** (check block: check-reqs at most three approved outside courses)

```
check-reqs(append-all([list: [list: "CSCI 0220", "MATH 1530"], three-outside-electives.take(2)]))
  is all-necessary
```

Input:

```
[list: "CSCI 0220", "MATH 1530", "APMA 1080", "DATA 1030"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 12 passed this test, 4 failed it, 1 gave no result. Those that failed: 4 returned `has-unnecessary`.

**suite-O, line 164** (check block: overlap: MATH 1530 takes the foundation, 0220 becomes Series C's extra)

```
check-reqs([list:
    "MATH 0100", "CSCI 0190", "CSCI 0220", "MATH 1530",
    "CSCI 0500", "CSCI 0410", "CSCI 0300",
    "CSCI 1010", "CSCI 1260", "CSCI 1270", "CSCI 1380", "CSCI 1410",
    "MATH 0520", "APMA 1080", "APMA 1160"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 12 passed this test, 3 failed it, 2 gave no result. Those that failed: 2 returned `has-unnecessary`; 1 returned `completed`.

**suite-Q, line 151** (check block: check-reqs counts technical courses first)

```
check-reqs(TECHNICAL-FIRST-TWO) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0190", "MATH 1530", "CSCI 0220", "CSCI 0500", "CSCI 0300", "CSCI 0410",
  "CSCI 1230", "CSCI 1650", "CSCI 1950", "CSCI 2345", "CSCI 1000", "CSCI 2999", "CSCI 2200",
  "CSCI 1870", "DEVL 1810"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 12 passed this test, 3 failed it, 2 gave no result. Those that failed: 3 returned `has-unnecessary`.

**suite-Q, line 152** (check block: check-reqs counts technical courses first)

```
check-reqs(NONTECHNICAL-FIRST-TWO) is completed
```

Input:

```
[list: "CSCI 2200", "CSCI 1870", "DEVL 1810", "MATH 0100", "CSCI 0190", "MATH 1530", "CSCI 0220",
  "CSCI 0500", "CSCI 0300", "CSCI 0410", "CSCI 1230", "CSCI 1650", "CSCI 1950", "CSCI 2345",
  "CSCI 1000", "CSCI 2999"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 12 passed this test, 3 failed it, 2 gave no result. Those that failed: 3 returned `has-unnecessary`.

**suite-R, line 77** (check block: intro sequences - cs 19 special cases (200+ level for the second in the sequence))

```
check-reqs([list: "CSCI 0190", "MATH 1530", "CSCI 0220"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 12 passed this test, 3 failed it, 2 gave no result. Those that failed: 2 returned `has-unnecessary`; 1 raised an exception: "unexpected input".

### Passed by 11 of the other 17 implementations: 15 tests

**suite-B, line 85** (check block: introductory math foundations requirements)

```
check-reqs([list: "MATH 1530", "CSCI 0220"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 11 passed this test, 6 failed it. Those that failed: 6 returned `has-unnecessary`.

**suite-B, line 317** (check block: math foundations allocation: a fourth non-technical course fills the CS19 slot)

```
check-reqs([list:
  "MATH 0100", "CSCI 0190", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "MATH 1530", "CSCI 0220",
  "CSCI 1010", "CSCI 1230", "CSCI 1410", "CSCI 1670", "CSCI 1810",
  "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1800"]) is completed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 11 passed this test, 4 failed it, 2 gave no result. Those that failed: 3 returned `has-unnecessary`; 1 returned `all-necessary`.

**suite-C, line 29** (check block: empty rosters and unrelated courses are harmless)

```
check-reqs([list: "HIST 1000", "BIOL 0200", "CSCI 0081", "APMA 1920"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 11 passed this test, 6 failed it. Those that failed: 6 returned `has-unnecessary`.

**suite-C, line 59** (check block: foundation alternatives and math allocation)

```
check-reqs([list: "CSCI 0220", "MATH 1530"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 11 passed this test, 4 failed it, 2 gave no result. Those that failed: 4 returned `has-unnecessary`.

**suite-C, line 69** (check block: the accelerated extra course cannot also fill another requirement)

```
check-reqs(no-second + [list: "CSCI 0530"]) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0190", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230",
  "CSCI 1260", "CSCI 1270", "CSCI 1310", "CSCI 1510", "CSCI 0320", "MATH 0520", "APMA 1650",
  "CSCI 2000", "CSCI 0530"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 11 passed this test, 4 failed it, 2 gave no result. Those that failed: 3 returned `all-necessary`; 1 returned `has-unnecessary`.

**suite-M, line 228** (check block: check-reqs courses with suffixes)

```
check-reqs(append-all([list: series-a, csci-1000-level(num-total-electives - 1),
      merged-courses])) is all-necessary
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "CSCI 1230", "CSCI 1240", "CSCI 1270", "CSCI 1300", "CSCI 1302",
  "CSCI 1310", "CSCI 1311", "CSCI 1340", "CSCI 2951A", "CSCI 2951B"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 11 passed this test, 4 failed it, 2 gave no result. Those that failed: 3 returned `has-unnecessary`; 1 returned `malformed`.

**suite-M, line 231** (check block: check-reqs courses with suffixes)

```
check-reqs(append-all([list: series-a, csci-1000-level(num-total-electives - 1),
      [list: "CSCI 2951", "CSCI 2951A"]])) is all-necessary
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "CSCI 1230", "CSCI 1240", "CSCI 1270", "CSCI 1300", "CSCI 1302",
  "CSCI 1310", "CSCI 1311", "CSCI 1340", "CSCI 2951", "CSCI 2951A"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 11 passed this test, 4 failed it, 2 gave no result. Those that failed: 3 returned `has-unnecessary`; 1 returned `malformed`.

**suite-M, line 418** (check block: check-reqs non-technical courses with suffixes)

```
check-reqs(append-all([list: core-d, csci-1000-level(num-technical-electives - 1),
      [list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 2402C"], linear-algebra]))
  is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0111", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1230", "CSCI 1240", "CSCI 1270", "CSCI 1300", "CSCI 1250", "CSCI 1280", "CSCI 1360",
  "CSCI 2402C", "MATH 0520"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 11 passed this test, 4 failed it, 2 gave no result. Those that failed: 3 returned `has-unnecessary`; 1 returned `malformed`.

**suite-M, line 422** (check block: check-reqs non-technical courses with suffixes)

```
check-reqs(append-all([list: series-a, csci-1000-level(num-total-electives - 1),
      [list: "CSCI 1952B", "CSCI 1952X"]])) is all-necessary
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "CSCI 1230", "CSCI 1240", "CSCI 1270", "CSCI 1300", "CSCI 1302",
  "CSCI 1310", "CSCI 1311", "CSCI 1340", "CSCI 1952B", "CSCI 1952X"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 11 passed this test, 4 failed it, 2 gave no result. Those that failed: 3 returned `has-unnecessary`; 1 returned `malformed`.

**suite-O, line 83** (check block: all-necessary: MATH 1530 is a valid additional elective, not unnecessary)

```
check-reqs([list: "MATH 1530", "CSCI 0220"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 11 passed this test, 6 failed it. Those that failed: 6 returned `has-unnecessary`.

**suite-O, line 107** (check block: checking if wrong greedy solution (local optimal but not global optimal):  MATH 1530 must 
      take the foundation so 0220 can be Series C's extra)

```
check-reqs([list: "CSCI 0190", "APMA 1080", "APMA 1160", "APMA 1690", "CSCI 0220", "MATH 1530"])
  is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 11 passed this test, 5 failed it, 1 gave no result. Those that failed: 5 returned `has-unnecessary`.

**suite-O, line 172** (check block: overlap: 0220 and MATH 1530 with nothing else is all-necessary)

```
check-reqs([list: "CSCI 0190", "APMA 1080", "APMA 1160", "APMA 1690", "CSCI 0220", "MATH 1530"])
  is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 11 passed this test, 5 failed it, 1 gave no result. Those that failed: 5 returned `has-unnecessary`.

**suite-O, line 183** (check block: concentration filter is tight)

```
check-reqs([list: "CSCI 0190", "CSCI 0040"]) is all-necessary    # 0040 fits no slot
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 11 passed this test, 6 failed it. Those that failed: 6 returned `has-unnecessary`.

**suite-O, line 184** (check block: concentration filter is tight)

```
check-reqs([list: "CSCI 0190", "CSCI 0100"]) is all-necessary    # 0190 fits no slot
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 11 passed this test, 6 failed it. Those that failed: 6 returned `has-unnecessary`.

**suite-Q, line 188** (check block: check-reqs ignores courses not related to CSCI requirements)

```
check-reqs(COMPLETED-TEST-ONE) is completed
```

Input:

```
[list: "HIST 0150", "CSCI 0190", "CSCI 0200", "CSCI 0300", "CSCI 0410", "CSCI 0220", "VISA 0100",
  "CSCI 0500", "MATH 0190", "CSCI 1250", "PLCY 1702", "CSCI 1870", "ECON 1490", "CSCI 1233",
  "CSCI 1240", "CSCI 1400", "MATH 0350", "CSCI 1410", "CSCI 2000"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 11 passed this test, 4 failed it, 2 gave no result. Those that failed: 2 returned `has-unnecessary`; 2 returned `all-necessary`.

### Passed by 10 of the other 17 implementations: 16 tests

**suite-B, line 198** (check block: five technical electives requirement using check-reqs)

```
check-reqs([list:
  "CSCI 1010", "CSCI 1020", "CSCI 1030", "CSCI 1040", "CSCI 1050",
  "CSCI 1060", "CSCI 1070", "CSCI 1080", "CSCI 1090", "CSCI 1100"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 10 passed this test, 5 failed it, 2 gave no result. Those that failed: 5 returned `all-necessary`.

**suite-B, line 291** (check block: math foundations allocation: MATH 1530 needed for math foundations so CSCI 0220 fills the CS19 slot)

```
check-reqs([list:
  "MATH 0100", "CSCI 0190", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 0220", "MATH 1530",
  "CSCI 1010", "CSCI 1230", "CSCI 1410", "CSCI 1670", "CSCI 1810",
  "MATH 0520", "APMA 1080", "APMA 1160", "APMA 1690"]) is completed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 10 passed this test, 5 failed it, 2 gave no result. Those that failed: 5 returned `has-unnecessary`.

**suite-B, line 309** (check block: math foundations allocation: CSCI 0200 fills the CS19 slot so MATH 1530 goes to electives)

```
check-reqs([list:
  "MATH 0100", "CSCI 0190", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "MATH 1530", "CSCI 0220", "CSCI 0200",
  "CSCI 1010", "CSCI 1230", "CSCI 1410", "CSCI 1670", "CSCI 1810",
  "MATH 0520", "APMA 1080", "APMA 1160"]) is completed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 10 passed this test, 6 failed it, 1 gave no result. Those that failed: 6 returned `has-unnecessary`.

**suite-B, line 325** (check block: math foundations allocation: standard track keeps MATH 1530 for electives)

```
check-reqs([list:
  "MATH 0100", "CSCI 0150", "CSCI 0200", "CSCI 0500", "CSCI 0410", "CSCI 0330",
  "MATH 1530", "CSCI 0220",
  "CSCI 1010", "CSCI 1230", "CSCI 1410", "CSCI 1670", "CSCI 1810",
  "MATH 0520", "APMA 1080", "APMA 1160"]) is completed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 10 passed this test, 6 failed it, 1 gave no result. Those that failed: 6 returned `has-unnecessary`.

**suite-C, line 101** (check block: mutually exclusive courses are redundant before completion)

```
check-reqs([list: "CSCI 0190", "CSCI 0300", "CSCI 0330"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 10 passed this test, 7 failed it. Those that failed: 7 returned `all-necessary`.

**suite-I, line 175** (check block: nine elective slots: five technical plus four additional)

```
check-reqs(nine.append([list: "CSCI 1670"])) is has-unnecessary
```

Input:

```
[list: "CSCI 1230", "CSCI 1270", "CSCI 1290", "CSCI 1300", "CSCI 1310", "CSCI 1380", "CSCI 1470",
  "CSCI 1570", "CSCI 1660", "CSCI 1670"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 10 passed this test, 5 failed it, 2 gave no result. Those that failed: 5 returned `all-necessary`.

**suite-K, line 100** (check block: technical cs classes)

```
check-reqs([list: "CSCI 1001", "CSCI 1002",
    "CSCI 1003", "CSCI 1004", "CSCI 1005",
    "CSCI 1006", "CSCI 1007", "CSCI 1008",
    "CSCI 1009", "CSCI 1010"])
  is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 10 passed this test, 5 failed it, 2 gave no result. Those that failed: 5 returned `all-necessary`.

**suite-K, line 121** (check block: malformed)

```
check-reqs([list: "CSCI 0190hahahahaha"]) is all-necessary
```

Your implementation returned `malformed`.

Of the other 17 implementations: 10 passed this test, 7 failed it. Those that failed: 6 returned `malformed`; 1 returned `has-unnecessary`.

**suite-M, line 222** (check block: check-reqs courses with suffixes)

```
check-reqs(append-all([list: core-a, csci-1000-level(num-total-electives - 2),
      merged-courses])) is all-necessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1230", "CSCI 1240", "CSCI 1270", "CSCI 1300", "CSCI 1302", "CSCI 1310", "CSCI 1311",
  "CSCI 2951A", "CSCI 2951B"]
```

Your implementation returned `completed`.

Of the other 17 implementations: 10 passed this test, 5 failed it, 2 gave no result. Those that failed: 2 returned `completed`; 2 returned `has-unnecessary`; 1 returned `malformed`.

**suite-O, line 195** (check block: overlap: MATH 1530 takes the foundation, 0220 is Series C's extra)

```
check-reqs([list:
    "MATH 0100", "CSCI 0190", "CSCI 0220", "MATH 1530",
    "CSCI 0500", "CSCI 0410", "CSCI 0300",
    "CSCI 1010", "CSCI 1260", "CSCI 1270", "CSCI 1380", "CSCI 1410",
    "MATH 0520", "APMA 1080", "APMA 1160", "APMA 1690"]) is completed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 10 passed this test, 5 failed it, 2 gave no result. Those that failed: 5 returned `has-unnecessary`.

**suite-Q, line 49** (check block: example)

```
check-reqs([list:"CSCI 0200",
    "CSCI 0170", "CSCI 0300", "CSCI 0500", "CSCI 0410",
    "CSCI 0220", "CSCI 0320", "CSCI 1250", "CSCI 1000",
    "CSCI 1111", "CSCI 2222", "CSCI 2145", "CSCI 2220",
    "CSCI 1234", "CSCI 1443", "HIST 0150"])
  is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 10 passed this test, 5 failed it, 2 gave no result. Those that failed: 3 returned `completed`; 2 returned `has-unnecessary`.

**suite-Q, line 149** (check block: check-reqs counts technical courses first)

```
check-reqs(NONTECHNICAL-FIRST) is completed
```

Input:

```
[list: "CSCI 0190", "CSCI 0200", "CSCI 0300", "CSCI 0410", "CSCI 0220", "CSCI 0500", "MATH 0190",
  "CSCI 1250", "PLCY 1702", "CSCI 1870", "CSCI 2222", "CSCI 1233", "CSCI 1240", "CSCI 1400",
  "CSCI 1410", "CSCI 2000"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 10 passed this test, 5 failed it, 2 gave no result. Those that failed: 3 returned `all-necessary`; 2 returned `has-unnecessary`.

**suite-Q, line 150** (check block: check-reqs counts technical courses first)

```
check-reqs(TECHNICAL-FIRST) is completed
```

Input:

```
[list: "CSCI 0190", "CSCI 0200", "CSCI 0300", "CSCI 0410", "CSCI 0220", "CSCI 0500", "MATH 0190",
  "CSCI 1233", "CSCI 1240", "CSCI 1400", "CSCI 1410", "CSCI 2000", "CSCI 1250", "PLCY 1702",
  "CSCI 1870", "CSCI 2222"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 10 passed this test, 5 failed it, 2 gave no result. Those that failed: 3 returned `all-necessary`; 2 returned `has-unnecessary`.

**suite-Q, line 162** (check block: student can use CSCI 0320 as an additional elective)

```
check-reqs(USES-CSCI0320) is completed
```

Input:

```
[list: "CSCI 0190", "CSCI 0200", "CSCI 0300", "CSCI 0410", "CSCI 0220", "CSCI 0500", "MATH 0190",
  "CSCI 0320", "PLCY 1702", "CSCI 1870", "CSCI 2222", "CSCI 1233", "CSCI 1240", "CSCI 1400",
  "CSCI 1410", "CSCI 2000"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 10 passed this test, 5 failed it, 2 gave no result. Those that failed: 3 returned `all-necessary`; 2 returned `has-unnecessary`.

**suite-Q, line 339** (check block: accelerated-cs-with-two-math-foundations satisfies all sc.b. requirements)

```
check-reqs(ACCELERATED-CS-WITH-TWO-MATH-FOUNDATIONS-TEST) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0190", "CSCI 0220", "CSCI 0500", "CSCI 0300", "CSCI 0410", "CSCI 1230",
  "CSCI 1650", "CSCI 1950", "CSCI 2345", "CSCI 1000", "CSCI 2999", "APMA 1650", "MATH 1530",
  "APMA 1690", "CSCI 0320"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 10 passed this test, 5 failed it, 2 gave no result. Those that failed: 5 returned `has-unnecessary`.

**suite-Q, line 340** (check block: accelerated-cs-with-two-math-foundations satisfies all sc.b. requirements)

```
check-reqs(SHUFFLED-ACCELERATED-CS-WITH-TWO-MATH-FOUNDATIONS-TEST) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0190", "MATH 1530", "CSCI 0220", "CSCI 0500", "CSCI 0300", "CSCI 0410",
  "CSCI 1230", "CSCI 1650", "CSCI 1950", "CSCI 2345", "CSCI 1000", "CSCI 2999", "APMA 1650",
  "APMA 1690", "CSCI 0320"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 10 passed this test, 5 failed it, 2 gave no result. Those that failed: 5 returned `has-unnecessary`.

### Passed by 9 of the other 17 implementations: 10 tests

**suite-E, line 155** (check block: electives (technical and other) with has-unnecessary)

```
check-reqs([list: "CSCI 1420", "ENGN 2520"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 9 passed this test, 6 failed it, 2 gave no result. Those that failed: 6 returned `all-necessary`.

**suite-J, line 199** (check block: complete)

```
check-reqs(test-noncs) is completed
```

Input:

```
[list: "MATH 0190", "CSCI 0170", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0330",
  "CSCI 1120", "CSCI 2233", "CSCI 3366", "CSCI 4488", "CSCI 5599", "CSCI 1370", "APMA 1910",
  "DEVL 1810", "PHP  2630"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 9 passed this test, 6 failed it, 2 gave no result. Those that failed: 5 returned `has-unnecessary`; 1 returned `all-necessary`.

**suite-M, line 412** (check block: check-reqs non-technical courses with suffixes)

```
check-reqs(append-all([list: core-a, csci-1000-level(num-technical-electives - 1),
      [list: "CSCI 2952S"], linear-algebra, three-outside-electives])) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1230", "CSCI 1240", "CSCI 1270", "CSCI 1300", "CSCI 2952S", "MATH 0520", "APMA 1080",
  "DATA 1030", "MUSC 1210"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 9 passed this test, 6 failed it, 2 gave no result. Those that failed: 5 returned `has-unnecessary`; 1 returned `malformed`.

**suite-M, line 415** (check block: check-reqs non-technical courses with suffixes)

```
check-reqs(append-all([list: core-b, csci-1000-level(num-technical-electives - 1),
      [list: "CSCI 2999A"], linear-algebra, three-outside-electives])) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0170", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1230", "CSCI 1240", "CSCI 1270", "CSCI 1300", "CSCI 2999A", "MATH 0520", "APMA 1080",
  "DATA 1030", "MUSC 1210"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 9 passed this test, 6 failed it, 2 gave no result. Those that failed: 5 returned `has-unnecessary`; 1 returned `malformed`.

**suite-O, line 71** (check block: completed: MATH 1530 should fill the foundation so CSCI 0220 can be Series C's extra, 
      basically ensure our previously partially incorrect order is eliminated)

```
check-reqs([list:
    "MATH 0100",
    "CSCI 0190", "CSCI 0220",                    # Series C: 0190 + extra 0220
    "MATH 1530",                                 # math foundation
    "CSCI 0500", "CSCI 0410", "CSCI 0300",
    "CSCI 1010", "CSCI 1260", "CSCI 1270",
    "CSCI 1380", "CSCI 1410",                    # five 1000-level CSCI
    "MATH 0520", "APMA 1650",
    "MATH 1010", "MATH 1020"]) is completed      # four additional electives
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 9 passed this test, 6 failed it, 2 gave no result. Those that failed: 5 returned `has-unnecessary`; 1 returned `all-necessary`.

**suite-O, line 139** (check block: pair: ENGN 2520 cannot count alongside CSCI 1420)

```
check-reqs([list: "CSCI 1010", "CSCI 1020", "CSCI 1030", "CSCI 1040",
    "CSCI 1420", "ENGN 2520"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 9 passed this test, 7 failed it, 1 gave no result. Those that failed: 7 returned `all-necessary`.

**suite-O, line 144** (check block: greedy: MATH 1530 takes the foundation so 0220 is Series C's extra)

```
check-reqs([list:
    "MATH 0100", "CSCI 0190", "CSCI 0220", "MATH 1530",
    "CSCI 0500", "CSCI 0410", "CSCI 0300",
    "CSCI 1010", "CSCI 1260", "CSCI 1270", "CSCI 1380", "CSCI 1410",
    "MATH 0520", "APMA 1650", "MATH 1010", "MATH 1020"]) is completed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 9 passed this test, 6 failed it, 2 gave no result. Those that failed: 5 returned `has-unnecessary`; 1 returned `all-necessary`.

**suite-Q, line 104** (check block: check-reqs does not return malformed if input is well formed)

```
check-reqs([list: "CSCI 2340", "CSCI 0300", "CSCI 0220", "CSCI 0340"])
  is has-unnecessary # CSCI 0340 is unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 9 passed this test, 8 failed it. Those that failed: 8 returned `all-necessary`.

**suite-Q, line 303** (check block: MATH 1530 counted as additional requirement before counted as foundations course)

```
check-reqs(ABSTRACT-ALGEBRA-ADDITIONAL-ELECTIVE-TEST-ONE) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0300", "CSCI 0410",
  "CSCI 1230", "CSCI 1650", "CSCI 1950", "CSCI 2345", "CSCI 1000", "CSCI 2999", "APMA 1650",
  "MATH 1530", "APMA 1690"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 9 passed this test, 7 failed it, 1 gave no result. Those that failed: 7 returned `has-unnecessary`.

**suite-R, line 80** (check block: intro sequences - cs 19 special cases (200+ level for the second in the sequence))

```
check-reqs([list: "CSCI 0190", "CSCI 0300", "CSCI 0330"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 9 passed this test, 6 failed it, 2 gave no result. Those that failed: 6 returned `all-necessary`.

### Passed by 8 of the other 17 implementations: 8 tests

**suite-B, line 123** (check block: non-technical CS course limits)

```
check-reqs([list: "CSCI 1250", "CSCI 1800", "CSCI 1870", "CSCI 2200"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 8 passed this test, 8 failed it, 1 gave no result. Those that failed: 8 returned `all-necessary`.

**suite-B, line 124** (check block: non-technical CS course limits)

```
check-reqs([list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1370"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 8 passed this test, 8 failed it, 1 gave no result. Those that failed: 8 returned `all-necessary`.

**suite-B, line 151** (check block: conflicting and duplicate elective pairings)

```
check-reqs([list: "ENGN 2520", "CSCI 1420"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 8 passed this test, 9 failed it. Those that failed: 9 returned `all-necessary`.

**suite-B, line 237** (check block: complex prior usage: using courses that satisfy multiple overlapping pools)

```
check-reqs([list:
  "MATH 0100", "CSCI 0220", "CSCI 0111", "CSCI 0200",
  "CSCI 0500", "CSCI 0410", "CSCI 0330",
  "CSCI 0320", "ENGN 2520", "CSCI 1420", "APMA 1655",
  "CSCI 1410", "CSCI 1430", "CSCI 1470", "CSCI 1480", "CSCI 1950"]) is has-unnecessary
```

Your implementation returned `completed`.

Of the other 17 implementations: 8 passed this test, 7 failed it, 2 gave no result. Those that failed: 6 returned `completed`; 1 returned `all-necessary`.

**suite-C, line 105** (check block: mutually exclusive courses are redundant before completion)

```
check-reqs([list: "ENGN 2520", "CSCI 1420"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 8 passed this test, 9 failed it. Those that failed: 9 returned `all-necessary`.

**suite-I, line 167** (check block: at most three non-technical CSCI courses)

```
check-reqs([list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1370"])
  is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 8 passed this test, 8 failed it, 1 gave no result. Those that failed: 8 returned `all-necessary`.

**suite-K, line 76** (check block: additional non-cs elective unnecessary cases)

```
check-reqs([list: "ENGN 2520", "CSCI 1420"])
  is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 8 passed this test, 8 failed it, 1 gave no result. Those that failed: 8 returned `all-necessary`.

**suite-K, line 139** (check block: completed)

```
check-reqs([list:
    "MATH 0170",
    "CSCI 0150", "CSCI 0200",
    "MATH 1530",
    "CSCI 0500", "CSCI 0410", "CSCI 0330",
    "CSCI 1010S", "CSCI 1230-A", "CSCI 1302S", "CSCI 1410",
    "CSCI 1660 a quick brown fox jumps over a lazy dog",
    "CSCI 1800", "CSCI 0320", "CSCI 1970", "ENGN 1010",
    "HIST 0120", "LING 0100"] ) is completed
```

Your implementation returned `malformed`.

Of the other 17 implementations: 8 passed this test, 7 failed it, 2 gave no result. Those that failed: 6 returned `malformed`; 1 returned `all-necessary`.

### Passed by 7 of the other 17 implementations: 6 tests

**suite-F, line 202** (check block: malformed: badly formed course names)

```
check-reqs([list: "CSCI 01900"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 7 passed this test, 10 failed it. Those that failed: 9 returned `all-necessary`; 1 returned `has-unnecessary`.

**suite-G, line 20** (check block: malformed: too many digits)

```
check-reqs([list: "CSCI 01500"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 7 passed this test, 10 failed it. Those that failed: 9 returned `all-necessary`; 1 returned `has-unnecessary`.

**suite-M, line 388** (check block: check-reqs at most three non-technical course electives)

```
check-reqs([list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1370"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 7 passed this test, 8 failed it, 2 gave no result. Those that failed: 8 returned `all-necessary`.

**suite-Q, line 304** (check block: MATH 1530 counted as additional requirement before counted as foundations course)

```
check-reqs(ABSTRACT-ALGEBRA-ADDITIONAL-ELECTIVE-TEST-TWO) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0300", "CSCI 0410",
  "CSCI 1230", "CSCI 1650", "CSCI 1950", "CSCI 2345", "CSCI 1000", "CSCI 2999", "APMA 1650",
  "CSCI 0220", "APMA 1690"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 7 passed this test, 9 failed it, 1 gave no result. Those that failed: 9 returned `has-unnecessary`.

**suite-R, line 50** (check block: malformed input - incorrect ID)

```
check-reqs([list: "CSCI 01901"]) is malformed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 7 passed this test, 10 failed it. Those that failed: 9 returned `all-necessary`; 1 returned `has-unnecessary`.

**suite-R, line 56** (check block: malformed input - malformed suffixes and spacing)

```
check-reqs([list: "CSCI 1950A2"]) is malformed
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 7 passed this test, 10 failed it. Those that failed: 10 returned `all-necessary`.

### Passed by 6 of the other 17 implementations: 2 tests

**suite-N, line 153** (check block: series C with a non-0200 spare)

```
check-reqs(with-system-spare) is completed
```

Input:

```
[list: "CSCI 0330", "CSCI 0190", "MATH 0100", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1010", "CSCI 1260", "CSCI 1310", "CSCI 1410", "CSCI 1440", "CSCI 0320", "CSCI 1430",
  "MATH 0520", "APMA 1650"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 6 passed this test, 9 failed it, 2 gave no result. Those that failed: 9 returned `has-unnecessary`.

**suite-R, line 139** (check block: all-necessary - taking technical cs courses for electives (8 total))

```
check-reqs([list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1370",
    "CSCI 1800", "CSCI 1805", "CSCI 1860", "CSCI 1870"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 6 passed this test, 10 failed it, 1 gave no result. Those that failed: 10 returned `has-unnecessary`.

### Passed by 5 of the other 17 implementations: 4 tests

**suite-B, line 149** (check block: conflicting and duplicate elective pairings)

```
check-reqs([list: "EEPS 1340", "CSCI 1951"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 5 passed this test, 12 failed it. Those that failed: 12 returned `all-necessary`.

**suite-E, line 223** (check block: 2000-level and higher cs courses are additional electives only)

```
check-reqs(four-tech + [list: "CSCI 9999"]) is has-unnecessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1230", "CSCI 1270", "CSCI 1290", "CSCI 1310", "CSCI 0320", "MATH 0520", "APMA 1650",
  "ECON 1870", "CSCI 9999"]
```

Your implementation returned `completed`.

Of the other 17 implementations: 5 passed this test, 11 failed it, 1 gave no result. Those that failed: 11 returned `completed`.

**suite-E, line 224** (check block: 2000-level and higher cs courses are additional electives only)

```
check-reqs(four-tech + [list: "CSCI 1970"]) is has-unnecessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1230", "CSCI 1270", "CSCI 1290", "CSCI 1310", "CSCI 0320", "MATH 0520", "APMA 1650",
  "ECON 1870", "CSCI 1970"]
```

Your implementation returned `completed`.

Of the other 17 implementations: 5 passed this test, 11 failed it, 1 gave no result. Those that failed: 11 returned `completed`.

**suite-L, line 28** (check block: check-reqs)

```
check-reqs([list: "CSCI 1011*T"]) is malformed
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 5 passed this test, 10 failed it, 2 gave no result. Those that failed: 10 returned `all-necessary`.

### Passed by 4 of the other 17 implementations: 11 tests

**suite-A, line 117** (check block: non-technical courses are treated as technical)

```
check-reqs(build-roster(series-a-intro,
    [list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1370", "CSCI 1800"],
    [list: "CSCI 1805", "CSCI 1860", "CSCI 1870", "CSCI 2002"])) is completed
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "MATH 0100", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1370", "CSCI 1800", "CSCI 1805", "CSCI 1860",
  "CSCI 1870", "CSCI 2002"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 4 passed this test, 11 failed it, 2 gave no result. Those that failed: 9 returned `has-unnecessary`; 2 returned `all-necessary`.

**suite-B, line 147** (check block: conflicting and duplicate elective pairings)

```
check-reqs([list: "DATA 1340", "CSCI 1951"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 4 passed this test, 13 failed it. Those that failed: 13 returned `all-necessary`.

**suite-C, line 79** (check block: technical and total elective boundaries)

```
check-reqs(without-course(test-complete, "CSCI 1230") + [list: "CSCI 2500"])
  is has-unnecessary
```

Input:

```
[list: "MATH 0100", "CSCI 0190", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1260", "CSCI 1270", "CSCI 1310", "CSCI 1510", "CSCI 0320", "MATH 0520", "APMA 1650",
  "CSCI 2000", "CSCI 2500"]
```

Your implementation returned `completed`.

Of the other 17 implementations: 4 passed this test, 11 failed it, 2 gave no result. Those that failed: 10 returned `completed`; 1 returned `all-necessary`.

**suite-C, line 106** (check block: mutually exclusive courses are redundant before completion)

```
check-reqs([list: "DATA 1340", "CSCI 1951A"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 4 passed this test, 13 failed it. Those that failed: 12 returned `all-necessary`; 1 returned `malformed`.

**suite-E, line 209** (check block: CSCI independent studies can only be used up to twice)

```
check-reqs([list: "CSCI 1973", "CSCI 1973", "CSCI 1973"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 4 passed this test, 12 failed it, 1 gave no result. Those that failed: 12 returned `all-necessary`.

**suite-E, line 210** (check block: CSCI independent studies can only be used up to twice)

```
check-reqs([list: "CSCI 1970", "CSCI 1970", "CSCI 1970"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 4 passed this test, 12 failed it, 1 gave no result. Those that failed: 12 returned `all-necessary`.

**suite-E, line 222** (check block: 2000-level and higher cs courses are additional electives only)

```
check-reqs(four-tech + [list: "CSCI 2270"]) is has-unnecessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1230", "CSCI 1270", "CSCI 1290", "CSCI 1310", "CSCI 0320", "MATH 0520", "APMA 1650",
  "ECON 1870", "CSCI 2270"]
```

Your implementation returned `completed`.

Of the other 17 implementations: 4 passed this test, 12 failed it, 1 gave no result. Those that failed: 12 returned `completed`.

**suite-G, line 231** (check block: more than two CSCI 1970 - extra is unnecessary)

```
check-reqs([list: "MATH 0100",
    "CSCI 0150", "CSCI 0200", "CSCI 0220",
    "CSCI 0500", "CSCI 0410", "CSCI 0300",
    "CSCI 1000", "CSCI 1010", "CSCI 1020", "CSCI 1030", "CSCI 1040",
    "CSCI 1970", "CSCI 1970", "CSCI 1970", "CSCI 1050"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 4 passed this test, 11 failed it, 2 gave no result. Those that failed: 10 returned `all-necessary`; 1 returned `completed`.

**suite-H, line 205** (check block: [check-reqs] permits at most 3 non-technical courses to count toward additional electives)

```
check-reqs(replace(replace(replace(roster-basic-cs17,
        "MATH 0520", "IAPA 1801"),
      "CSCI 0320", "CSCI 1280"),
    "CSCI 1515", "APMA 1910")) is has-unnecessary # could technically be all-necessary
```

Input:

```
[list: "CSCI 0300", "CSCI 0170", "CSCI 1470", "CSCI 1250", "CSCI 1230", "CSCI 1280", "CSCI 1670",
  "CSCI 0200", "IAPA 1801", "CSCI 0500", "MATH 0100", "CSCI 0410", "CSCI 1260", "CSCI 0220",
  "APMA 1910", "CSCI 1420"]
```

Your implementation returned `completed`.

Of the other 17 implementations: 4 passed this test, 11 failed it, 2 gave no result. Those that failed: 11 returned `completed`.

**suite-O, line 135** (check block: pair: DATA 1340 and EEPS 1340 together leave one unnecessary)

```
check-reqs([list: "DATA 1340", "EEPS 1340"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 4 passed this test, 13 failed it. Those that failed: 13 returned `all-necessary`.

**suite-Q, line 403** (check block: check-reqs does not count both CSCI 0300 and 
      CSCI 0330 toward a concentration requirement)

```
check-reqs(COUNTS-ONLY-ONE-OF-COMPUTER-SYSTEMS-TEST) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0190", "MATH 1530", "CSCI 0220", "CSCI 0500", "CSCI 0300", "CSCI 0410",
  "CSCI 1230", "CSCI 1650", "CSCI 1950", "CSCI 2345", "CSCI 1000", "CSCI 2999", "APMA 1650",
  "APMA 1690", "CSCI 0330"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 4 passed this test, 11 failed it, 2 gave no result. Those that failed: 11 returned `has-unnecessary`.

### Passed by 3 of the other 17 implementations: 22 tests

**suite-E, line 156** (check block: electives (technical and other) with has-unnecessary)

```
check-reqs([list: "CSCI 1800", "CSCI 1805", "APMA 1910", "IAPA 1801"])
  is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 3 passed this test, 12 failed it, 2 gave no result. Those that failed: 12 returned `all-necessary`.

**suite-E, line 207** (check block: CSCI independent studies can only be used up to twice)

```
check-reqs([list: "CSCI 1970", "CSCI 1970", "CSCI 1973"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 3 passed this test, 13 failed it, 1 gave no result. Those that failed: 13 returned `all-necessary`.

**suite-E, line 208** (check block: CSCI independent studies can only be used up to twice)

```
check-reqs([list: "CSCI 1970", "CSCI 1973", "CSCI 1973"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 3 passed this test, 13 failed it, 1 gave no result. Those that failed: 13 returned `all-necessary`.

**suite-G, line 301** (check block: course cannot satisfy multiple requirements)

```
check-reqs([list: "CSCI 0150", "CSCI 0200", "CSCI 0220",
    "CSCI 0500", "CSCI 0410", "CSCI 0300",
    "CSCI 1000", "CSCI 1010", "CSCI 1020", "CSCI 1030", "CSCI 1040",
    "CSCI 0200"]) is has-unnecessary
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 3 passed this test, 13 failed it, 1 gave no result. Those that failed: 13 returned `all-necessary`.

**suite-J, line 226** (check block: necessary)

```
check-reqs(test-lowlevel) is all-necessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 0999", "CSCI 1101", "CSCI 2201", "CSCI 3301", "CSCI 4401", "CSCI 1250", "CSCI 1805",
  "APMA 1080", "CSCI 0320"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 3 passed this test, 12 failed it, 2 gave no result. Those that failed: 12 returned `has-unnecessary`.

**suite-L, line 30** (check block: check-reqs)

```
check-reqs([list: "C    1011-T"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 3 passed this test, 12 failed it, 2 gave no result. Those that failed: 12 returned `malformed`.

**suite-L, line 38** (check block: check-reqs)

```
check-reqs([list: "CSCI 0150", "CSCI 0200", "CSCI 0220"].append(ft).append(add))
  is completed
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230",
  "CSCI 1270", "CSCI 1420", "CSCI 1570", "CSCI 1710", "CSCI 0320", "MATH 0540", "APMA 1650",
  "CSCI 1800"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 3 passed this test, 12 failed it, 2 gave no result. Those that failed: 11 returned `all-necessary`; 1 returned `has-unnecessary`.

**suite-L, line 40** (check block: check-reqs)

```
check-reqs([list: "CSCI 0170", "CSCI 0200", "CSCI 0220"].append(ft).append(add))
  is completed
```

Input:

```
[list: "CSCI 0170", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230",
  "CSCI 1270", "CSCI 1420", "CSCI 1570", "CSCI 1710", "CSCI 0320", "MATH 0540", "APMA 1650",
  "CSCI 1800"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 3 passed this test, 12 failed it, 2 gave no result. Those that failed: 11 returned `all-necessary`; 1 returned `has-unnecessary`.

**suite-L, line 42** (check block: check-reqs)

```
check-reqs([list: "CSCI 0111", "CSCI 0200", "CSCI 0220"].append(ft).append(add))
  is completed
```

Input:

```
[list: "CSCI 0111", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230",
  "CSCI 1270", "CSCI 1420", "CSCI 1570", "CSCI 1710", "CSCI 0320", "MATH 0540", "APMA 1650",
  "CSCI 1800"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 3 passed this test, 12 failed it, 2 gave no result. Those that failed: 11 returned `all-necessary`; 1 returned `has-unnecessary`.

**suite-L, line 44** (check block: check-reqs)

```
check-reqs([list: "CSCI 0190", "CSCI 0200", "CSCI 0220"].append(ft).append(add))
  is completed
```

Input:

```
[list: "CSCI 0190", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230",
  "CSCI 1270", "CSCI 1420", "CSCI 1570", "CSCI 1710", "CSCI 0320", "MATH 0540", "APMA 1650",
  "CSCI 1800"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 3 passed this test, 12 failed it, 2 gave no result. Those that failed: 11 returned `all-necessary`; 1 returned `has-unnecessary`.

**suite-L, line 50** (check block: check-reqs)

```
check-reqs([list: "ECON 0110", "CSCI 0150", "CSCI 0200", "CSCI 0220"]
    .append(ft).append(add)) is completed
```

Input:

```
[list: "ECON 0110", "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1230", "CSCI 1270", "CSCI 1420", "CSCI 1570", "CSCI 1710", "CSCI 0320", "MATH 0540",
  "APMA 1650", "CSCI 1800"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 3 passed this test, 12 failed it, 2 gave no result. Those that failed: 10 returned `all-necessary`; 2 returned `has-unnecessary`.

**suite-L, line 52** (check block: check-reqs)

```
check-reqs([list: "CSCI 1230", "CSCI 0150", "CSCI 0200", "CSCI 0220"]
    .append(ft).append(add)) is completed
```

Input:

```
[list: "CSCI 1230", "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1230", "CSCI 1270", "CSCI 1420", "CSCI 1570", "CSCI 1710", "CSCI 0320", "MATH 0540",
  "APMA 1650", "CSCI 1800"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 3 passed this test, 12 failed it, 2 gave no result. Those that failed: 8 returned `all-necessary`; 4 returned `has-unnecessary`.

**suite-L, line 56** (check block: check-reqs)

```
check-reqs([list: "CSCI 0150", "CSCI 0200", "MATH 1530"].append(ft).append(add))
  is completed
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230",
  "CSCI 1270", "CSCI 1420", "CSCI 1570", "CSCI 1710", "CSCI 0320", "MATH 0540", "APMA 1650",
  "CSCI 1800"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 3 passed this test, 12 failed it, 2 gave no result. Those that failed: 11 returned `all-necessary`; 1 returned `has-unnecessary`.

**suite-L, line 68** (check block: check-reqs)

```
check-reqs([list: "CSCI 0150", "CSCI 0200", "CSCI 0220",
    "CSCI 0500", "CSCI 0410", "CSCI 0300",
    "CSCI 1230", "CSCI 1270", "CSCI 1420", "CSCI 1570", "CSCI 1710",
    "CSCI 1660", "CSCI 1380", "MATH 0540", "APMA 1650"]) is completed
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 3 passed this test, 12 failed it, 2 gave no result. Those that failed: 12 returned `all-necessary`.

**suite-L, line 121** (check block: check-reqs)

```
check-reqs([list: "CSCI 0150", "CSCI 0200", "CSCI 0220"].append(ft)
    .append([list: "CSCI 0320", "MATH 0540", "APMA 1650", "CSCI 1950Y"]))
  is completed
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230",
  "CSCI 1270", "CSCI 1420", "CSCI 1570", "CSCI 1710", "CSCI 0320", "MATH 0540", "APMA 1650",
  "CSCI 1950Y"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 3 passed this test, 12 failed it, 2 gave no result. Those that failed: 11 returned `all-necessary`; 1 returned `malformed`.

**suite-L, line 138** (check block: check-reqs)

```
check-reqs([list: "CSCI 0190", "CSCI 0200", "CSCI 0220"].append(ft).append(add))
  is completed
```

Input:

```
[list: "CSCI 0190", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230",
  "CSCI 1270", "CSCI 1420", "CSCI 1570", "CSCI 1710", "CSCI 0320", "MATH 0540", "APMA 1650",
  "CSCI 1800"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 3 passed this test, 12 failed it, 2 gave no result. Those that failed: 11 returned `all-necessary`; 1 returned `has-unnecessary`.

**suite-L, line 142** (check block: check-reqs)

```
check-reqs([list: "CSCI 0190", "CSCI 0650", "MATH 1530"].append(ft)
    .append([list: "MATH 0540", "APMA 1650", "CSCI 1800", "CSCI 1950"]))
  is completed
```

Input:

```
[list: "CSCI 0190", "CSCI 0650", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230",
  "CSCI 1270", "CSCI 1420", "CSCI 1570", "CSCI 1710", "MATH 0540", "APMA 1650", "CSCI 1800",
  "CSCI 1950"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 3 passed this test, 12 failed it, 2 gave no result. Those that failed: 11 returned `all-necessary`; 1 returned `has-unnecessary`.

**suite-L, line 145** (check block: check-reqs)

```
check-reqs([list: "CSCI 0190", "CSCI 0320", "MATH 1530"].append(ft)
    .append([list: "MATH 0540", "APMA 1650", "CSCI 1800", "CSCI 1950"]))
  is completed
```

Input:

```
[list: "CSCI 0190", "CSCI 0320", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230",
  "CSCI 1270", "CSCI 1420", "CSCI 1570", "CSCI 1710", "MATH 0540", "APMA 1650", "CSCI 1800",
  "CSCI 1950"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 3 passed this test, 12 failed it, 2 gave no result. Those that failed: 12 returned `all-necessary`.

**suite-L, line 150** (check block: check-reqs)

```
check-reqs([list: "CSCI 0190", "MATH 1530", "CSCI 1950"].append(ft)
    .append([list: "MATH 0540", "APMA 1650", "CSCI 1800", "CSCI 1805"]))
  is completed
```

Input:

```
[list: "CSCI 0190", "MATH 1530", "CSCI 1950", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230",
  "CSCI 1270", "CSCI 1420", "CSCI 1570", "CSCI 1710", "MATH 0540", "APMA 1650", "CSCI 1800",
  "CSCI 1805"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 3 passed this test, 12 failed it, 2 gave no result. Those that failed: 12 returned `all-necessary`.

**suite-L, line 159** (check block: check-reqs)

```
check-reqs([list: "CSCI 0190", "CSCI 0220", "MATH 1530"].append(ft)
    .append([list: "MATH 0540", "APMA 1650", "ENGN 1010", "CLPS 1211"]))
  is completed
```

Input:

```
[list: "CSCI 0190", "CSCI 0220", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230",
  "CSCI 1270", "CSCI 1420", "CSCI 1570", "CSCI 1710", "MATH 0540", "APMA 1650", "ENGN 1010",
  "CLPS 1211"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 3 passed this test, 12 failed it, 2 gave no result. Those that failed: 7 returned `all-necessary`; 5 returned `has-unnecessary`.

**suite-L, line 163** (check block: check-reqs)

```
check-reqs([list: "CSCI 0190", "CSCI 0220", "CSCI 0320"].append(ft)
    .append([list: "ENGN 1010", "CLPS 1211", "CSCI 1800", "CSCI 1805"]))
  is completed
```

Input:

```
[list: "CSCI 0190", "CSCI 0220", "CSCI 0320", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230",
  "CSCI 1270", "CSCI 1420", "CSCI 1570", "CSCI 1710", "ENGN 1010", "CLPS 1211", "CSCI 1800",
  "CSCI 1805"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 3 passed this test, 12 failed it, 2 gave no result. Those that failed: 12 returned `all-necessary`.

**suite-Q, line 232** (check block: check-reqs keeps track of every nontechnical course)

```
distinct(map(check-reqs, HAS-UNNECESSARY-LIST-NONTECH)) is [list: has-unnecessary]
```

Your implementation failed (failure-not-equal): Values not equal [list: completed, has-unnecessary] [list: has-unnecessary].

Of the other 17 implementations: 3 passed this test, 12 failed it, 2 gave no result. Those that failed: 4 failed (failure-not-equal): Values not equal [list: completed] [list: has-unnecessary]; 4 failed (failure-not-equal): Values not equal [list: has-unnecessary, completed] [list: has-unnecessary]; 1 failed (failure-not-equal): Values not equal [list: all-necessary, completed, has-unnecessary] [list: has-unnecessary]; 1 failed (failure-not-equal): Values not equal [list: all-necessary, completed] [list: has-unnecessary]; 1 failed (failure-not-equal): Values not equal [list: has-unnecessary, all-necessary] [list: has-unnecessary]; 1 failed (failure-not-equal): Values not equal [list: has-unnecessary, completed, all-necessary] [list: has-unnecessary].

### Passed by 2 of the other 17 implementations: 1 test

**suite-L, line 124** (check block: check-reqs)

```
check-reqs([list: "CSCI 0150", "CSCI 0200", "CSCI 0220"].append(ft)
    .append([list: "CSCI 0320", "MATH 0540", "CSCI 1950Y", "CSCI 1950Z"]))
  is has-unnecessary
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230",
  "CSCI 1270", "CSCI 1420", "CSCI 1570", "CSCI 1710", "CSCI 0320", "MATH 0540", "CSCI 1950Y",
  "CSCI 1950Z"]
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 2 passed this test, 13 failed it, 2 gave no result. Those that failed: 12 returned `all-necessary`; 1 returned `malformed`.

### Passed by 1 of the other 17 implementations: 14 tests

**suite-J, line 221** (check block: necessary)

```
check-reqs(test-tech-cap) is all-necessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1100", "CSCI 2100", "CSCI 3100", "CSCI 4100", "CSCI 5100", "CSCI 6100", "CSCI 7100",
  "CSCI 8100", "CSCI 9100", "CSCI 9998"]
```

Your implementation returned `completed`.

Of the other 17 implementations: 1 passed this test, 14 failed it, 2 gave no result. Those that failed: 9 returned `completed`; 5 returned `has-unnecessary`.

**suite-J, line 222** (check block: necessary)

```
check-reqs(test-lin-cap) is all-necessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1101", "CSCI 2201", "CSCI 3301", "CSCI 4401", "CSCI 5501", "APMA 1080", "MUSC 1210",
  "MATH 0520", "MATH 0540", "APMA 0260"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 1 passed this test, 14 failed it, 2 gave no result. Those that failed: 14 returned `has-unnecessary`.

**suite-J, line 223** (check block: necessary)

```
check-reqs(test-noncs-cap) is all-necessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1101", "CSCI 2201", "CSCI 3301", "CSCI 4401", "CSCI 5501", "APMA 1080", "APMA 1160",
  "APMA 1690", "APMA 1170"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 1 passed this test, 14 failed it, 2 gave no result. Those that failed: 14 returned `has-unnecessary`.

**suite-J, line 224** (check block: necessary)

```
check-reqs(test-nontech-cap) is all-necessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "CSCI 0220", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1101", "CSCI 2201", "CSCI 3301", "CSCI 4401", "CSCI 5501", "CSCI 1250", "CSCI 1280",
  "CSCI 1360", "CSCI 1800"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 1 passed this test, 14 failed it, 2 gave no result. Those that failed: 12 returned `has-unnecessary`; 2 returned `completed`.

**suite-J, line 229** (check block: necessary)

```
check-reqs([list: "CS I 1000"]) is all-necessary
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 1 passed this test, 14 failed it, 2 gave no result. Those that failed: 14 returned `malformed`.

**suite-L, line 59** (check block: check-reqs)

```
check-reqs([list: "CSCI 0150", "CSCI 0200", "MATH 1060", "CSCI 0320", "MATH 1010",
    "APMA 1650", "CSCI 1800"].append(ft))
  is completed
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "MATH 1060", "CSCI 0320", "MATH 1010", "APMA 1650", "CSCI 1800",
  "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230", "CSCI 1270", "CSCI 1420", "CSCI 1570",
  "CSCI 1710"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 1 passed this test, 14 failed it, 2 gave no result. Those that failed: 11 returned `has-unnecessary`; 3 returned `all-necessary`.

**suite-L, line 63** (check block: check-reqs)

```
check-reqs([list: "CSCI 0150", "CSCI 0200"].append(ft)
    .append([list: "MATH 0540", "CSCI 0320", "APMA 1650", "CSCI 1800", "CSCI 1950"]))
  is completed
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230", "CSCI 1270",
  "CSCI 1420", "CSCI 1570", "CSCI 1710", "MATH 0540", "CSCI 0320", "APMA 1650", "CSCI 1800",
  "CSCI 1950"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 1 passed this test, 14 failed it, 2 gave no result. Those that failed: 13 returned `has-unnecessary`; 1 returned `all-necessary`.

**suite-L, line 154** (check block: check-reqs)

```
check-reqs([list: "CSCI 0190", "CSCI 0320", "MATH 0540"].append(ft)
    .append([list: "APMA 1650", "CSCI 1800", "CSCI 1950", "CSCI 2950"]))
  is completed
```

Input:

```
[list: "CSCI 0190", "CSCI 0320", "MATH 0540", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230",
  "CSCI 1270", "CSCI 1420", "CSCI 1570", "CSCI 1710", "APMA 1650", "CSCI 1800", "CSCI 1950",
  "CSCI 2950"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 1 passed this test, 14 failed it, 2 gave no result. Those that failed: 12 returned `has-unnecessary`; 2 returned `all-necessary`.

**suite-L, line 194** (check block: check-reqs)

```
check-reqs([list: "CSCI 0150", "CSCI 0200", "MATH 0530", "APMA 1655", "CSCI 0320",
    "MATH 1010", "APMA 1650", "CSCI 1800"].append(ft)) is completed
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "MATH 0530", "APMA 1655", "CSCI 0320", "MATH 1010", "APMA 1650",
  "CSCI 1800", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230", "CSCI 1270", "CSCI 1420",
  "CSCI 1570", "CSCI 1710"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 1 passed this test, 14 failed it, 2 gave no result. Those that failed: 12 returned `has-unnecessary`; 2 returned `all-necessary`.

**suite-L, line 197** (check block: check-reqs)

```
check-reqs([list: "CSCI 0150", "CSCI 0200", "MATH 0530", "APMA 1655", "CSCI 0320",
    "MATH 1010", "APMA 1650", "CSCI 1800"].append(ft)) is completed
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "MATH 0530", "APMA 1655", "CSCI 0320", "MATH 1010", "APMA 1650",
  "CSCI 1800", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230", "CSCI 1270", "CSCI 1420",
  "CSCI 1570", "CSCI 1710"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 1 passed this test, 14 failed it, 2 gave no result. Those that failed: 12 returned `has-unnecessary`; 2 returned `all-necessary`.

**suite-L, line 206** (check block: check-reqs)

```
check-reqs([list: "CSCI 0150", "CSCI 0200", "MATH 0530", "APMA 1655", "CSCI 0320",
    "EEPS 1960D", "APMA 1080", "CSCI 1800"].append(ft)) is completed
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "MATH 0530", "APMA 1655", "CSCI 0320", "EEPS 1960D", "APMA 1080",
  "CSCI 1800", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230", "CSCI 1270", "CSCI 1420",
  "CSCI 1570", "CSCI 1710"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 1 passed this test, 14 failed it, 2 gave no result. Those that failed: 9 returned `all-necessary`; 4 returned `has-unnecessary`; 1 returned `malformed`.

**suite-L, line 215** (check block: check-reqs)

```
check-reqs([list: "CSCI 0150", "CSCI 0190", "CSCI 0220", "MATH 0530", "APMA 1655", "EEPS 1340",
    "APMA 1080", "CSCI 1010"].append(ft)) is completed
```

Input:

```
[list: "CSCI 0150", "CSCI 0190", "CSCI 0220", "MATH 0530", "APMA 1655", "EEPS 1340", "APMA 1080",
  "CSCI 1010", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1230", "CSCI 1270", "CSCI 1420",
  "CSCI 1570", "CSCI 1710"]
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 1 passed this test, 14 failed it, 2 gave no result. Those that failed: 14 returned `has-unnecessary`.

**suite-O, line 211** (check block: CSCI 1973 is used to fill two requirements)

```
check-reqs([list:
    "MATH 0100", "CSCI 0190", "CSCI 0200", "CSCI 0220",
    "CSCI 0500", "CSCI 0410", "CSCI 0300",
    "CSCI 1010", "CSCI 1260", "CSCI 1270", "CSCI 1380", "CSCI 1973",
    "MATH 0520", "APMA 1080", "APMA 1160"]) is completed
```

Your implementation returned `all-necessary`.

Of the other 17 implementations: 1 passed this test, 15 failed it, 1 gave no result. Those that failed: 15 returned `all-necessary`.

**suite-O, line 216** (check block: CSCI 1973 is used to fill two requirements)

```
check-reqs([list:
    "MATH 0100", "CSCI 0190", "CSCI 0220",
    "CSCI 0500", "CSCI 0410", "CSCI 0300",
    "CSCI 1010", "CSCI 1260", "CSCI 1270", "CSCI 1380", "CSCI 1973",
    "MATH 0520", "MATH 1000", "APMA 1080", "APMA 1160"]) is
completed
```

Your implementation returned `has-unnecessary`.

Of the other 17 implementations: 1 passed this test, 15 failed it, 1 gave no result. Those that failed: 14 returned `all-necessary`; 1 returned `has-unnecessary`.
