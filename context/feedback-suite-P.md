# Test suite report for PPL7-ACN8 and WZA3-YZY6

This is the suite labelled `suite-P` in the overall results. It was run against 18 implementations, labelled `impl-01` to `impl-18`.

- 58 tests in all.  
- 25 passed on every implementation that produced a result for them. For 6 of these, some implementations produced no result; the table below says which implementations and why.  
- 33 failed on at least one implementation; each is listed below with what the implementations did instead.  
- 15 failed on at least half of the implementations that gave a result for them: line 90; line 94; line 95; line 99; line 103; line 107; line 108; line 109; line 110; line 115; line 116; line 119; line 124; line 128; line 132\.

## Results by implementation

| Implementation | Tests | Passed | Failed | No result | Note |
| :---- | :---- | :---- | :---- | :---- | :---- |
| impl-01 | 58 | 33 | 25 | 0 |  |
| impl-02 | 58 | 36 | 22 | 0 |  |
| impl-03 | 58 | 41 | 17 | 0 |  |
| impl-04 | 58 | 43 | 15 | 0 |  |
| impl-05 | 58 | 43 | 15 | 0 |  |
| impl-06 | 58 | 57 | 1 | 0 |  |
| impl-07 | 58 | 41 | 17 | 0 |  |
| impl-08 | 58 | 19 | 0 | 39 | did not finish the whole suite in one run; run block by block, 19 check blocks (39 tests) still did not finish |
| impl-09 | 58 | 57 | 1 | 0 |  |
| impl-10 | 58 | 58 | 0 | 0 |  |
| impl-11 | 58 | 57 | 1 | 0 |  |
| impl-12 | 58 | 44 | 14 | 0 |  |
| impl-13 | 58 | 43 | 15 | 0 |  |
| impl-14 | 58 | 58 | 0 | 0 |  |
| impl-15 | 58 | 42 | 16 | 0 |  |
| impl-16 | 58 | 56 | 2 | 0 |  |
| impl-17 | 58 | 22 | 0 | 36 | did not finish the whole suite in one run; run block by block, 16 check blocks (36 tests) still did not finish |
| impl-18 | 58 | 40 | 18 | 0 |  |

## How many implementations failed each test

Each row counts the tests that a given number of the 18 implementations failed. A test that most implementations fail, especially in the same way, may be a test that is wrong, so the top rows are where to look first. A test that only a few implementations fail is more likely catching mistakes in those implementations.

| Implementations that failed | Tests |  |
| :---- | :---- | :---- |
| 10 of 18 | 2 | ██ |
| 9 of 18 | 13 | █████████████ |
| 7 of 18 | 2 | ██ |
| 3 of 18 | 1 | █ |
| 2 of 18 | 10 | ██████████ |
| 1 of 18 | 5 | █████ |
| 0 of 18 | 25 | █████████████████████████ |

## Tests that at least one implementation failed

In the order of the table above: the tests that the most implementations failed come first.

### Failed by 10 of 18 implementations: 2 tests

**Line 99** (check block: completed intro-math combinations)

```
check-reqs(drop-course(exact-completed-roster, "MATH 1530") + [list: "CSCI 0220"]) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1000",
  "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520", "CSCI 1970",
  "CSCI 1970", "CSCI 0220"]
```

Of 18 implementations: 6 passed, 10 failed, 2 gave no result.

- 9 returned `all-necessary`: impl-02, impl-03, impl-04, impl-05, impl-07, impl-12, impl-13, impl-15, impl-18  
- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 10 s: impl-08, impl-17

**Line 124** (check block: order doesn't matter)

```
check-reqs(exact-completed-roster.reverse()) is completed
```

Input:

```
[list: "CSCI 1970", "CSCI 1970", "MATH 0520", "CSCI 0320", "CSCI 1004", "CSCI 1003", "CSCI 1002",
  "CSCI 1001", "CSCI 1000", "CSCI 0300", "CSCI 0410", "CSCI 0500", "MATH 1530", "CSCI 0200",
  "CSCI 0150", "MATH 0100"]
```

Of 18 implementations: 6 passed, 10 failed, 2 gave no result.

- 9 returned `all-necessary`: impl-02, impl-03, impl-04, impl-05, impl-07, impl-13, impl-15, impl-16, impl-18  
- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 10 s: impl-08, impl-17

### Failed by 9 of 18 implementations: 13 tests

**Line 90** (check block: happy case for completed)

```
check-reqs(exact-completed-roster) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520",
  "CSCI 1970", "CSCI 1970"]
```

Of 18 implementations: 7 passed, 9 failed, 2 gave no result.

- 8 returned `all-necessary`: impl-02, impl-03, impl-04, impl-05, impl-07, impl-13, impl-15, impl-18  
- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 10 s: impl-08, impl-17

**Line 94** (check block: completed prereq combinations)

```
check-reqs(drop-course(exact-completed-roster, "MATH 0100") + [list: "MATH 0170"]) is completed
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1000",
  "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520", "CSCI 1970",
  "CSCI 1970", "MATH 0170"]
```

Of 18 implementations: 7 passed, 9 failed, 2 gave no result.

- 8 returned `all-necessary`: impl-02, impl-03, impl-04, impl-05, impl-07, impl-13, impl-15, impl-18  
- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 20 s: impl-08, impl-17

**Line 95** (check block: completed prereq combinations)

```
check-reqs(drop-course(exact-completed-roster, "MATH 0100") + [list: "MATH 0190"]) is completed
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1000",
  "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520", "CSCI 1970",
  "CSCI 1970", "MATH 0190"]
```

Of 18 implementations: 7 passed, 9 failed, 2 gave no result.

- 8 returned `all-necessary`: impl-02, impl-03, impl-04, impl-05, impl-07, impl-13, impl-15, impl-18  
- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 20 s: impl-08, impl-17

**Line 103** (check block: completed foundations combinations)

```
check-reqs(drop-course(exact-completed-roster, "CSCI 0300") + [list: "CSCI 0330"]) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 1000",
  "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520", "CSCI 1970",
  "CSCI 1970", "CSCI 0330"]
```

Of 18 implementations: 7 passed, 9 failed, 2 gave no result.

- 8 returned `all-necessary`: impl-02, impl-03, impl-04, impl-05, impl-07, impl-13, impl-15, impl-18  
- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 10 s: impl-08, impl-17

**Line 107** (check block: completed core-cs combinations)

```
check-reqs(drop-course(exact-completed-roster, "CSCI 0150") + [list: "CSCI 0111"]) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1000",
  "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520", "CSCI 1970",
  "CSCI 1970", "CSCI 0111"]
```

Of 18 implementations: 7 passed, 9 failed, 2 gave no result.

- 8 returned `all-necessary`: impl-02, impl-03, impl-04, impl-05, impl-07, impl-13, impl-15, impl-18  
- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 40 s: impl-08, impl-17

**Line 108** (check block: completed core-cs combinations)

```
check-reqs(drop-course(exact-completed-roster, "CSCI 0150") + [list: "CSCI 0170"]) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1000",
  "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520", "CSCI 1970",
  "CSCI 1970", "CSCI 0170"]
```

Of 18 implementations: 7 passed, 9 failed, 2 gave no result.

- 8 returned `all-necessary`: impl-02, impl-03, impl-04, impl-05, impl-07, impl-13, impl-15, impl-18  
- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 40 s: impl-08, impl-17

**Line 109** (check block: completed core-cs combinations)

```
check-reqs(drop-course(exact-completed-roster, "CSCI 0150") + [list: "CSCI 0190"]) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1000",
  "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520", "CSCI 1970",
  "CSCI 1970", "CSCI 0190"]
```

Of 18 implementations: 7 passed, 9 failed, 2 gave no result.

- 8 returned `all-necessary`: impl-02, impl-03, impl-04, impl-05, impl-07, impl-13, impl-15, impl-18  
- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 40 s: impl-08, impl-17

**Line 110** (check block: completed core-cs combinations)

```
check-reqs(drop-course(drop-course(exact-completed-roster, "CSCI 0150") + [list: "CSCI 0190"],
    "CSCI 0200") + [list: "CSCI 3000"]) is completed
```

Input:

```
[list: "MATH 0100", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1000", "CSCI 1001",
  "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520", "CSCI 1970", "CSCI 1970",
  "CSCI 0190", "CSCI 3000"]
```

Of 18 implementations: 7 passed, 9 failed, 2 gave no result.

- 7 returned `all-necessary`: impl-02, impl-03, impl-04, impl-07, impl-13, impl-15, impl-18  
- 2 returned `has-unnecessary`: impl-01, impl-05  
- 2 did not finish this check block within 40 s: impl-08, impl-17

**Line 115** (check block: completed four-add combinations)

```
check-reqs(drop-course(exact-completed-roster, "MATH 0520") + [list: "MATH 0540"]) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "CSCI 1970",
  "CSCI 1970", "MATH 0540"]
```

Of 18 implementations: 7 passed, 9 failed, 2 gave no result.

- 8 returned `all-necessary`: impl-02, impl-03, impl-04, impl-05, impl-07, impl-13, impl-15, impl-18  
- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 40 s: impl-08, impl-17

**Line 116** (check block: completed four-add combinations)

```
check-reqs(drop-course(exact-completed-roster, "MATH 0520") + [list: "APMA 0260"]) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "CSCI 1970",
  "CSCI 1970", "APMA 0260"]
```

Of 18 implementations: 7 passed, 9 failed, 2 gave no result.

- 8 returned `all-necessary`: impl-02, impl-03, impl-04, impl-05, impl-07, impl-13, impl-15, impl-18  
- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 40 s: impl-08, impl-17

**Line 119** (check block: completed four-add combinations)

```
check-reqs(drop-course(exact-completed-roster, "CSCI 1970") + [list: "CSCI 1973", "CSCI 1973"])
  is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520",
  "CSCI 1973", "CSCI 1973"]
```

Of 18 implementations: 7 passed, 9 failed, 2 gave no result.

- 8 returned `all-necessary`: impl-02, impl-03, impl-04, impl-05, impl-07, impl-13, impl-15, impl-18  
- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 40 s: impl-08, impl-17

**Line 128** (check block: complete with redundant prereqs)

```
check-reqs(exact-completed-roster + [list: "MATH 0170"]) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520",
  "CSCI 1970", "CSCI 1970", "MATH 0170"]
```

Of 18 implementations: 7 passed, 9 failed, 2 gave no result.

- 8 returned `has-unnecessary`: impl-01, impl-02, impl-03, impl-04, impl-05, impl-07, impl-15, impl-18  
- 1 returned `all-necessary`: impl-13  
- 2 did not finish this check block within 10 s: impl-08, impl-17

**Line 132** (check block: complete with redundant intro-cs)

```
check-reqs(exact-completed-roster + [list: "CSCI 0190"]) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520",
  "CSCI 1970", "CSCI 1970", "CSCI 0190"]
```

Of 18 implementations: 7 passed, 9 failed, 2 gave no result.

- 9 returned `has-unnecessary`: impl-01, impl-02, impl-03, impl-04, impl-05, impl-07, impl-13, impl-15, impl-18  
- 2 did not finish this check block within 10 s: impl-08, impl-17

### Failed by 7 of 18 implementations: 2 tests

**Line 140** (check block: double counts)

```
check-reqs(drop-course(exact-completed-roster-cs19, "CSCI 0200") + [list: "CSCI 0330"])
  is has-unnecessary
```

Input:

```
[list: "MATH 0100", "CSCI 0190", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1000",
  "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520", "CSCI 1970",
  "CSCI 1970", "CSCI 0330"]
```

Of 18 implementations: 9 passed, 7 failed, 2 gave no result.

- 4 returned `all-necessary`: impl-03, impl-07, impl-12, impl-18  
- 3 returned `completed`: impl-06, impl-11, impl-16  
- 2 did not finish this check block within 10 s: impl-08, impl-17

**Line 172** (check block: overuse non-technical cs)

```
check-reqs(drop-course(exact-completed-roster-non-tech, "CSCI 0320") + [list: "CSCI 1370"])
  is has-unnecessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 1250", "CSCI 1280",
  "CSCI 1360", "CSCI 1370"]
```

Of 18 implementations: 9 passed, 7 failed, 2 gave no result.

- 5 returned `completed`: impl-01, impl-03, impl-07, impl-12, impl-15  
- 2 returned `all-necessary`: impl-02, impl-18  
- 2 did not finish this check block within 10 s: impl-08, impl-17

### Failed by 3 of 18 implementations: 1 test

**Line 193** (check block: happy case for all-necessary)

```
check-reqs(missing-prereq) is all-necessary
```

Input:

```
[list: "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1000",
  "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520", "CSCI 1970",
  "CSCI 1970"]
```

Of 18 implementations: 13 passed, 3 failed, 2 gave no result.

- 1 raised an exception: "unexpected input": impl-12  
- 1 returned `completed`: impl-09  
- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 130 s: impl-08, impl-17

### Failed by 2 of 18 implementations: 10 tests

**Line 145** (check block: missing 1000-level class, no double counting)

```
check-reqs(drop-course(exact-completed-roster, "CSCI 1002")) is all-necessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1000", "CSCI 1001", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520", "CSCI 1970",
  "CSCI 1970"]
```

Of 18 implementations: 15 passed, 2 failed, 1 gave no result.

- 1 raised an exception: "unexpected input": impl-12  
- 1 returned `has-unnecessary`: impl-01  
- 1 did not finish this check block within 10 s: impl-08

**Line 149** (check block: redundant linear algebras)

```
check-reqs(drop-course(exact-completed-roster, "CSCI 0320") + [list: "MATH 0540"])
  is has-unnecessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "MATH 0520", "CSCI 1970",
  "CSCI 1970", "MATH 0540"]
```

Of 18 implementations: 14 passed, 2 failed, 2 gave no result.

- 2 returned `all-necessary`: impl-02, impl-12  
- 2 did not finish this check block within 10 s: impl-08, impl-17

**Line 154** (check block: redundant ampa 16xx)

```
check-reqs(drop-course(exact-completed-roster-apma, "MATH 0520") + [list: "APMA 1655"])
  is has-unnecessary
```

Input:

```
[list: "MATH 0100", "CSCI 0190", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "APMA 1650", "CSCI 1970",
  "CSCI 1970", "APMA 1655"]
```

Of 18 implementations: 14 passed, 2 failed, 2 gave no result.

- 2 returned `all-necessary`: impl-02, impl-12  
- 2 did not finish this check block within 10 s: impl-08, impl-17

**Line 163** (check block: overuse non-cs)

```
check-reqs(drop-course(exact-completed-roster-non-cs, "CSCI 0320") + [list: "APMA 1170"])
  is has-unnecessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "APMA 1080", "APMA 1160",
  "APMA 1690", "APMA 1170"]
```

Of 18 implementations: 14 passed, 2 failed, 2 gave no result.

- 2 returned `all-necessary`: impl-02, impl-18  
- 2 did not finish this check block within 10 s: impl-08, impl-17

**Line 194** (check block: happy case for all-necessary)

```
check-reqs(missing-core-abd) is all-necessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1000",
  "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520", "CSCI 1970",
  "CSCI 1970"]
```

Of 18 implementations: 14 passed, 2 failed, 2 gave no result.

- 1 raised an exception: "unexpected input": impl-12  
- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 130 s: impl-08, impl-17

**Line 195** (check block: happy case for all-necessary)

```
check-reqs(missing-core-c) is all-necessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1000",
  "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520", "CSCI 1970",
  "CSCI 1970"]
```

Of 18 implementations: 14 passed, 2 failed, 2 gave no result.

- 1 raised an exception: "unexpected input": impl-12  
- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 130 s: impl-08, impl-17

**Line 197** (check block: happy case for all-necessary)

```
check-reqs(missing-foundations-a) is all-necessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0410", "CSCI 0300", "CSCI 1000",
  "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520", "CSCI 1970",
  "CSCI 1970"]
```

Of 18 implementations: 14 passed, 2 failed, 2 gave no result.

- 1 raised an exception: "unexpected input": impl-12  
- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 130 s: impl-08, impl-17

**Line 198** (check block: happy case for all-necessary)

```
check-reqs(missing-foundations-b) is all-necessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0300", "CSCI 1000",
  "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520", "CSCI 1970",
  "CSCI 1970"]
```

Of 18 implementations: 14 passed, 2 failed, 2 gave no result.

- 1 raised an exception: "unexpected input": impl-12  
- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 130 s: impl-08, impl-17

**Line 199** (check block: happy case for all-necessary)

```
check-reqs(missing-foundations-c) is all-necessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 1000",
  "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520", "CSCI 1970",
  "CSCI 1970"]
```

Of 18 implementations: 14 passed, 2 failed, 2 gave no result.

- 1 raised an exception: "unexpected input": impl-12  
- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 130 s: impl-08, impl-17

**Line 200** (check block: happy case for all-necessary)

```
check-reqs(missing-tech-elect) is all-necessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520", "CSCI 1970",
  "CSCI 1970"]
```

Of 18 implementations: 14 passed, 2 failed, 2 gave no result.

- 1 raised an exception: "unexpected input": impl-12  
- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 130 s: impl-08, impl-17

### Failed by 1 of 18 implementations: 5 tests

**Line 82** (check block: completed but unnecessary (should return completed anyways))

```
check-reqs(redundant-cs-courses) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 1005", "CSCI 0320",
  "MATH 0520", "CSCI 1970", "CSCI 1970", "CSCI 0170"]
```

Of 18 implementations: 15 passed, 1 failed, 2 gave no result.

- 1 returned `has-unnecessary`: impl-02  
- 2 did not finish this check block within 20 s: impl-08, impl-17

**Line 86** (check block: completed but unnecessary (should return completed anyways))

```
check-reqs(extra-non-cs-courses) is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 1005", "CSCI 0320",
  "MATH 0520", "CSCI 1970", "CSCI 1970", "MATH 0170"]
```

Of 18 implementations: 15 passed, 1 failed, 2 gave no result.

- 1 returned `has-unnecessary`: impl-02  
- 2 did not finish this check block within 20 s: impl-08, impl-17

**Line 117** (check block: completed four-add combinations)

```
check-reqs(drop-course(exact-completed-roster, "CSCI 1970") + [list: "CSCI 1970", "CSCI 1973"])
  is completed
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520",
  "CSCI 1970", "CSCI 1973"]
```

Of 18 implementations: 15 passed, 1 failed, 2 gave no result.

- 1 returned `all-necessary`: impl-02  
- 2 did not finish this check block within 40 s: impl-08, impl-17

**Line 196** (check block: happy case for all-necessary)

```
check-reqs(missing-intro-math) is all-necessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1000",
  "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520", "CSCI 1970",
  "CSCI 1970"]
```

Of 18 implementations: 15 passed, 1 failed, 2 gave no result.

- 1 returned `has-unnecessary`: impl-01  
- 2 did not finish this check block within 130 s: impl-08, impl-17

**Line 201** (check block: happy case for all-necessary)

```
check-reqs(missing-four-add) is all-necessary
```

Input:

```
[list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", "CSCI 0300",
  "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 0320", "MATH 0520"]
```

Of 18 implementations: 15 passed, 1 failed, 2 gave no result.

- 1 raised an exception: "unexpected input": impl-12  
- 2 did not finish this check block within 130 s: impl-08, impl-17

## Tests that no implementation failed

- malformed: line 63; line 64; line 65  
- completed but malformed: line 69; line 70; line 71; line 72; line 73; line 74  
- has-unnecessary but malformed: line 136  
- completed with non-cs: line 159  
- completed with non-technical cs: line 168  
- all-necessary but malformed: line 177; line 178; line 179; line 180; line 181; line 182; line 183; line 184; line 185  
- happy case for all-necessary: line 189; line 190; line 191; line 192