    [contents](javascript:void(0); "show/hide table of contents")  [←
prev](contfrac.html "backward to "ContFracs"")  [up](assignments.html "up to "Assignments"")  [next
→](mst.html "forward to "MST"") 

CSCI 0190 · Fall 2026

### Requirements 1[🔗](#(part._reqs-1) "Link to here") 

|                                                                         |
|-------------------------------------------------------------------------|
|     [1 What is This Assignment’s Purpose?](#%28part._reqs-1-purpose%29) |
|     [2 Theme Song](#%28part._reqs-1-ts%29)                              |
|     [3 Problem Setup](#%28part._reqs-1-setup%29)                        |
|     [4 Assignment](#%28part._reqs-1-asgn%29)                            |
|     [5 Setup](#%28part._reqs-1-files%29)                                |
|     [6 Assumptions/Well-Formedness](#%28part._reqs-1-assumptions%29)    |
|     [7 AI](#%28part._reqs-1-ai%29)                                      |
|     [8 Testing](#%28part._reqs-1-test%29)                               |
|     [9 Starter](#%28part._reqs-1-start%29)                              |
|     [10 Submission](#%28part._reqs-1-submission%29)                     |

#### 1 What is This Assignment’s Purpose?[🔗](#(part._reqs-1-purpose) "Link to here") 

You will now get practice dealing with reading, understanding, and
translating complex real-world into machine-checkable form.

#### 2 Theme Song[🔗](#(part._reqs-1-ts) "Link to here") 

[Stronger (What Doesn’t Kill
You)](https://www.youtube.com/watch?v=Xn676-fLq7I) by Kelly Clarkson

#### 3 Problem Setup[🔗](#(part._reqs-1-setup) "Link to here") 

To make it personally relevant to (most of) you, instead of making up
some artificial setting or talking about a third party, we’re going to
work directly with the computer science graduation requirements. For
simplicity, we’ll focus just on the ScB in computer science. You can
find them in the [university
Bulletin](https://bulletin.brown.edu/the-college/concentrations/comp/).

The more detailed requirements are provided in the [department’s
Concentrator
Handbook](https://cs.brown.edu/degrees/undergrad/concentrating-in-cs/concentration-handbook/).
This is what you should consult as a student for your own planning. But
to keep the assignment simple, we will use the requirements given in the
Bulletin, except where it defers to the Handbook (that is, think of
those parts of the Handbook as being “in” the Bulletin, but otherwise
ignore the Handbook).

Finally, we will ignore two things:

1.  Any clauses related to “legacy” students. These are to help students
    who started before the current requirements were put in place. For
    simplicity, we will assume we are only checking students who started
    under the new requirements (which includes most of you).

2.  The Capstone requirement. Capstones are a matter of human
    (professor) judgment, which we cannot automate here, so just for the
    purposes of this assignment (not your own graduation!), pretend that
    the Capstone is not required.

You can assume that no course is listed more than once on the roster.
You can also assume that course names are “canonicalized”: that is, if a
course is cross-listed, it’s listed in the same way always. In turn, you
should make sure that the tests you create don’t violate these
requirements.

#### 4 Assignment[🔗](#(part._reqs-1-asgn) "Link to here") 

You are given an individual student’s list of courses, intended for the
ScB in CS concentration. Your task is to write a function

> |                                             |
> |---------------------------------------------|
> | check-reqs :: List\<String\> -\> Completion |

All course names will be formatted as strings with four upper-case
letters, a space, and four digits: e.g., "CSCI 0190", "APMA 1650". The
list of course names may contain courses that are irrelevant to the CS
concentration; you should ignore those.

As for the return type:

The most basic checker might consume this list and return a Boolean:
either the coure list meets the requirements or not. However, a student
may want to use this checker at every step of their progress towards
graduation, so a declaration might be incomplete. Therefore, you have to
also be able to handle partial completion.

Furthermore, there are two kinds of partial completion. One is where
every course a student has taken meets a requirement; they just haven’t
taken enough. The other is where a student, by design or accident, has
taken a course that is part of the concentration requirements list—as
opposed to non-concentration courses—but is not necessary for
completion.To be really clear: it’s good to learn more things! There’s
no such thing as an “unnecessary” course—indeed, it may be a very
necessary course for the student’s goals!—except in this very narrow
sense. (Ignoring non-concentration courses lets a student just dump
their entire course listing into the checker. Those other courses are
irrelevant here.) They may, for instance, run the checker before
registering for a semester. That student should be alerted to this so
they can ensure that this was intentional.

Next, if you think about it for a moment, there is no such thing as
non-progress. Even the empty set of courses is a kind of “progress”. Of
course, a student may have made it hard to realistically finish: e.g.,
if they require eight more courses and have only one semester left. This
is outside our ambit. Therefore, even in a Boolean checker, there is no
false outcome.

Finally, it’s possible that an input is malformed in some way: e.g., the
letters may not be upper-case, the space may be missing, there may not
be four digits, etc. While all of your tests will (and should!) be
impeccable, someone else’s may not be
\[[Testing](#%28part._reqs-1-test%29)\]. If you detect something off,
you should flag that explicitly.

Putting this together, the checker returns one of four decisions:

> |                                                                      |
> |----------------------------------------------------------------------|
> | data Completion:                                                     |
> |   \| completed        \# requirements listed above met, can graduate |
> |   \| all-necessary    \# making progress, no unnecessary courses     |
> |   \| has-unnecessary  \# making progress, has unnecessary courses    |
> |   \| malformed        \# input is malformed                          |
> | end                                                                  |

Prioritize reporting these in the following order:

1.  If it’s malformed, you shouldn’t, and maybe even can’t, pass
    judgment on the list. It should first be fixed.

2.  If a student has met their requirements, even if they have
    additional, unnecessary courses, the important thing is that they
    can graduate. Therefore, prioritize completed over the other two.

3.  If they have “unnecessary” courses, alert them to it. Recall that
    they may run it before taking courses, and this may enable them to
    take a non-concentration course that they thought they couldn’t.
    This course is a big fan of taking non-concentration courses. So
    has-unnecessary comes next.

4.  The lowest priority is all-necessary. This student is running a
    tight ship, and everything looks shipshape, mate.

This definition is given to you in the file reqs-common.arr
([Setup](#%28part._reqs-1-files%29)); use it as-is, unmodified, rather
than writing your own.

#### 5 Setup[🔗](#(part._reqs-1-files) "Link to here") 

For this assignment you will work on your own machine, in VSC, with the
Pyret extension (see “Pyret on Your Machine” in
[Software](software.html)). Even if you prefer the Node version, your
partner may not, and may be reluctant to say so. To avoid friction, we
are requiring everyone to use the VSC version.

There are three relevant files, and you should put them all in the same
folder:

- We provide reqs-common.arr. This defines Completion. Do not modify
  this file, and do not copy its contents into your other files. The
  grading infrastructure uses its own copy, so a change you make here
  would at best be ignored and at worst make your other files error. If
  in doubt, or if you accidentally modify it, you can always re-download
  a fresh copy.

- Define your check-reqs in a file called check-reqs.arr. We have
  provided you with a starter version of this file. Do not modify the
  code at the top!

- Define your tests ([Testing](#%28part._reqs-1-test%29)) in a file
  called tests.arr. We have provided you with a starter version of this
  file. Do not modify the code at the top!

To run your tests, open tests.arr in VSC and click Run. The grader will
simulate the same setting (three files in one folder, with the reference
version of reqs-common.arr provided automatically).

#### 6 Assumptions/Well-Formedness[🔗](#(part._reqs-1-assumptions) "Link to here") 

Please make the following assumptions so that things are consistent
across everyone:

- All courses will have four letters. Department names with only three
  letters (like PHP) will be padded with an extra space after the
  department name: e.g., PHP 0060 (two spaces between P and 0).

- Assume that all “placement” and other courses (such as AP credits) are
  explicitly reflected in the course list.

- Ignore any placement exams and other things not on the transcript. If
  a student takes a course, assume they have met the course’s
  requirements. For instance, if a student claims to be taking CSCI
  0190, assume that something else has checked that they have passed the
  summer placement.

There’s really no such thing as a course that doesn’t “exist”. There may
be a new course added since you last got a list of courses; or an old
course may have been dropped (after having been taken by a student). If
you have a definitive semester for each course, then it would make sense
to talk about whether a course exists or not, but not otherwise.
Therefore, we are going to disregard this issue and assume every course
listed is a valid one.

In principle, [some computer science
courses](https://cs.brown.edu/courses/) have suffixes (e.g., CSCI 2951S
or CSCI 2951-S), and so do some courses in other departments. For the
purposes of this assignment, ignore everything past the digits (so treat
all CSCI 2951s as the same course, however many additional things there
are past the 1). That means we can no longer distinguish technical from
non-technical courses in that set; instead, treat all of them as
technical.

#### 7 AI[🔗](#(part._reqs-1-ai) "Link to here") 

You are welcome to use AI for this assignment. If you do, you should use
our AI setup ([Software](software.html)). Keep in mind that you take
responsibility for the work it does! You should understand its output
and be able to answer questions about it. Treat it as an aid to your
work, not as a substitute for your work.

#### 8 Testing[🔗](#(part._reqs-1-test) "Link to here") 

The department runs a similar piece of software over concentration
declarations in a student’s last semester. Mistakes here would be very
expensive: they would either prevent a student from graduating or
accidentally award degrees to students who have not earned them.
Therefore, this is something we, and especially you, would definitely
consider “mission-critical software”!

Therefore, you should aim for the highest levels of robustness. That
means, in particular, producing a really good test suite.

In fact, we’re going to do something fun: we’re going to run each of
your tests against everyone else’s implementations. You will then
receive a report on what happened. Observe that if your implementation
fails, it could be a bug in your code, a problem in the test, or just a
disagreement about how to interpret the requirements; likewise if your
test triggers a failure.

Concretely, your tests go in tests.arr as ordinary check blocks that
call check-reqs and compare its result against one of the four
decisions:

> |                                                                     |
> |---------------------------------------------------------------------|
> | check "intro sequences":                                            |
> |   check-reqs(\[list: "CSCI 0190", "CSCI 0200"\]) is all-necessary   |
> |   check-reqs(\[list: "CSCI 0190", "CSCI 0150"\]) is has-unnecessary |
> | end                                                                 |

You are free to use the full language to organize your tests. For
instance, you can use variables to define common course blocks, write
functions to build a course roster, etc.

There is one important constraint. Because your tests will be run
against other’s implementations, tests.arr may refer to only one thing
from check-reqs.arr: the function check-reqs. If your tests use some
helper from your implementation, they will fail to run against everyone
else’s implementations. Any helpers your tests need belong in tests.arr
itself.

#### 9 Starter[🔗](#(part._reqs-1-start) "Link to here") 

Create a folder for this assignment and save each of these three files
into it, keeping their names unchanged:

- [reqs-common.arr](Req-1/reqs-common.arr)

- [check-reqs.arr](Req-1/check-reqs.arr)

- [tests.arr](Req-1/tests.arr)

Then open that folder in VSC. See [Setup](#%28part._reqs-1-files%29) for
what each file is for.

#### 10 Submission[🔗](#(part._reqs-1-submission) "Link to here") 

Upload exactly two files to Gradescope: check-reqs.arr and tests.arr,
with exactly those names. Do not upload reqs-common.arr; the grader
supplies its own copy. Do not rename the files or change their include
lines: the grading infrastructure depends on both.

    [contents](javascript:void(0); "show/hide table of contents")  [←
prev](contfrac.html "backward to "ContFracs"")  [up](assignments.html "up to "Assignments"")  [next
→](mst.html "forward to "MST"") 

 
