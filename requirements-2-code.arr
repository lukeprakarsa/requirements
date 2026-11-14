use context essentials2021

provide *
provide-types *

include file("reqs-common.arr")

include file("requirements-2-common.arr")

# DO NOT CHANGE ANYTHING ABOVE THIS LINE
#
# You may write implementation-specific tests (e.g., of helper functions) in this file.

UPPERCASE-LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
DIGITS = "0123456789"
DEPT-LENGTH = 4
NUMBER-START = 5
COURSE-NAME-LENGTH = 9
SERIES-C-MIN-LEVEL = 200
ONE-THOUSAND-LEVEL = 1000
TWO-THOUSAND-LEVEL = 2000
TECHNICAL-ELECTIVE-COUNT = 5
ADDITIONAL-ELECTIVE-COUNT = 4
NON-TECHNICAL-CAP = 3
OUTSIDE-COURSE-CAP = 3

CALCULUS-COURSES = [list: "MATH 0100", "MATH 0170", "MATH 0190"]
INTRO-COURSES = [list: "CSCI 0111", "CSCI 0150", "CSCI 0170", "CSCI 0190", "CSCI 0200"]
MATH-FOUNDATION-COURSES = [list: "CSCI 0220", "MATH 1530"]
LINEAR-ALGEBRA-COURSES = [list: "MATH 0520", "MATH 0540", "APMA 0260"]
SYSTEMS-COURSE = "CSCI 0300"
ALTERNATE-SYSTEMS-COURSE = "CSCI 0330"
SOFTWARE-ENGINEERING-COURSE = "CSCI 0320"
INDEPENDENT-STUDY-COURSES = [list: "CSCI 1970", "CSCI 1973"]
APMA-165X-COURSES = [list: "APMA 1650", "APMA 1655"]
ENGN-PAIR-CSCI-COURSES = [list: "CSCI 1420"]
ENGN-PAIR-OUTSIDE-COURSES = [list: "ENGN 2520"]
DATA-PAIR-CSCI-COURSES = [list: "CSCI 1951"]
DATA-PAIR-OUTSIDE-COURSES = [list: "DATA 1340", "EEPS 1340"]
APPROVED-OUTSIDE-COURSES = [list: "APMA 1080", "APMA 1160", "APMA 1690", "APMA 1170",
  "APMA 1200", "APMA 1210", "APMA 1360", "APMA 1650", "APMA 1655", "APMA 1660", "APMA 1670",
  "APMA 1710", "APMA 1720", "APMA 1740", "APMA 1910", "APMA 1930", "APMA 2822", "PHP  2630",
  "PHP  2650", "CLPS 1211", "CLPS 1291", "CLPS 1342", "CLPS 1350", "CLPS 1491", "CLPS 1492",
  "CLPS 1520", "CLPS 1950", "DATA 1030", "DATA 1340", "DATA 1080", "DEVL 1810", "EEPS 1340",
  "EEPS 1720", "ECON 1490", "ECON 1870", "EDUC 1485", "ENGN 1010", "ENGN 1550", "ENGN 1570",
  "ENGN 1580", "ENGN 1590", "ENGN 1600", "ENGN 1610", "ENGN 1630", "ENGN 1640", "ENGN 1650",
  "ENGN 1660", "ENGN 1800", "ENGN 1931", "ENGN 2520", "IAPA 1701", "IAPA 1801", "IAPA 1811",
  "MUSC 1210", "NEUR 1440", "NEUR 1660", "PHIL 1630", "PHIL 1635", "PHIL 1675", "PHIL 1835",
  "PHIL 1855", "PHIL 1880", "PHYS 1590", "PHYS 1600", "PHYS 2550", "PHP  1855", "PHP  1689",
  "PLCY 1702", "ARTS 1550"]
NON-TECHNICAL-COURSES = [list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1370",
  "CSCI 1800", "CSCI 1805", "CSCI 1860", "CSCI 1870", "CSCI 2002", "CSCI 2200", "APMA 1910",
  "DEVL 1810", "IAPA 1701", "IAPA 1801", "PLCY 1702"]

fun check-requirements(courses :: List<String>) -> Completion:
  doc: "https://cs.brown.edu/courses/csci0190/2026/reqs-2.html"

  if not(well-formed(courses)):
    malformed
  else:
    trimmed-courses = distinct(map(drop-suffix, courses))
    countable-courses = keep-one-systems-course(
      drop-when-present(trimmed-courses, ENGN-PAIR-CSCI-COURSES, ENGN-PAIR-OUTSIDE-COURSES))
    better-completion(
      best-allocation(trimmed-courses,
        drop-when-present(countable-courses, DATA-PAIR-CSCI-COURSES, DATA-PAIR-OUTSIDE-COURSES)),
      best-allocation(trimmed-courses,
        drop-when-present(countable-courses, DATA-PAIR-OUTSIDE-COURSES, DATA-PAIR-CSCI-COURSES)))
  end
end

fun best-allocation(courses :: List<String>, countable-courses :: List<String>) -> Completion:
  doc: "the better result of allocate with either math foundation tried first"
  better-completion(allocate(courses, countable-courses, MATH-FOUNDATION-COURSES),
    allocate(courses, countable-courses, MATH-FOUNDATION-COURSES.reverse()))
end

check "best-allocation: CSCI 0220 can be the extra course when MATH 1530 is the foundation":
  best-allocation([list: "CSCI 0190", "CSCI 0220", "MATH 1530"],
    [list: "CSCI 0190", "CSCI 0220", "MATH 1530"]) is all-necessary
  best-allocation(
    [list: "CSCI 0150", "APMA 1170", "APMA 1200", "CLPS 1211", "CSCI 0220", "MATH 1530"],
    [list: "CSCI 0150", "APMA 1170", "APMA 1200", "CLPS 1211", "CSCI 0220", "MATH 1530"])
    is has-unnecessary
end

fun drop-when-present(
    roster :: List<String>, keep-courses :: List<String>, drop-courses :: List<String>)
  -> List<String>:
  doc: "removes drop-courses from roster if roster has any of keep-courses"
  if any(lam(course): roster.member(course) end, keep-courses):
    filter(lam(course): not(drop-courses.member(course)) end, roster)
  else:
    roster
  end
end

check "drop-when-present: drops only when a course to keep is on the roster":
  drop-when-present([list: "ENGN 2520", "CSCI 1420"], [list: "CSCI 1420"], [list: "ENGN 2520"])
    is [list: "CSCI 1420"]
  drop-when-present([list: "ENGN 2520", "CSCI 1430"], [list: "CSCI 1420"], [list: "ENGN 2520"])
    is [list: "ENGN 2520", "CSCI 1430"]
  drop-when-present([list: "DATA 1340", "EEPS 1340", "CSCI 1951"], DATA-PAIR-OUTSIDE-COURSES,
    [list: "CSCI 1951"]) is [list: "DATA 1340", "EEPS 1340"]
  drop-when-present(empty, [list: "CSCI 1420"], [list: "ENGN 2520"]) is empty
end

fun allocate(courses :: List<String>, countable-courses :: List<String>,
    math-order :: List<String>) -> Completion:
  doc: "assigns countable-courses to requirements; any other course in courses is unnecessary"
  {prereqs-sat; prereqs-seen} = prereqs(countable-courses, empty)
  {intro-math-sat; intro-math-seen} = intro-math(countable-courses, prereqs-seen, math-order)
  {foundations-sat; foundations-seen} = foundations(countable-courses, intro-math-seen)
  {core-cs-sat; core-cs-seen} = core-cs(countable-courses, foundations-seen)
  {tech-elec-sat; tech-elec-seen} = tech-elec(countable-courses, core-cs-seen)
  {four-add-sat; four-add-seen} = four-add(countable-courses, tech-elec-seen)
  {series-c-sat; all-seen} = series-c-extra(countable-courses, tech-elec-seen + four-add-seen)

  ask:
    | prereqs-sat and intro-math-sat and foundations-sat and
      core-cs-sat and tech-elec-sat and four-add-sat and series-c-sat then:
      completed
    | not(is-empty(not-yet-seen(filter(concentration-course, courses), all-seen))) then:
      has-unnecessary
    | otherwise: all-necessary
  end
end

check "allocate: the math order decides where CSCI 0220 goes; uncounted courses are unnecessary":
  allocate([list: "CSCI 0190", "APMA 1170", "APMA 1200", "CLPS 1211", "CSCI 0220", "MATH 1530"],
    [list: "CSCI 0190", "APMA 1170", "APMA 1200", "CLPS 1211", "CSCI 0220", "MATH 1530"],
    [list: "CSCI 0220", "MATH 1530"]) is has-unnecessary
  allocate([list: "CSCI 0190", "APMA 1170", "APMA 1200", "CLPS 1211", "CSCI 0220", "MATH 1530"],
    [list: "CSCI 0190", "APMA 1170", "APMA 1200", "CLPS 1211", "CSCI 0220", "MATH 1530"],
    [list: "MATH 1530", "CSCI 0220"]) is all-necessary
  allocate([list: "ENGN 2520", "CSCI 1420"], [list: "CSCI 1420"], [list: "CSCI 0220", "MATH 1530"])
    is has-unnecessary
  allocate(empty, empty, [list: "CSCI 0220", "MATH 1530"]) is all-necessary
end

fun better-completion(first :: Completion, second :: Completion) -> Completion:
  doc: "picks the better of two allocations of one roster: completed, then all-necessary"
  cases (Completion) first:
    | completed => completed
    | all-necessary =>
      cases (Completion) second:
        | completed => completed
        | all-necessary => all-necessary
        | has-unnecessary => all-necessary
        | malformed => raise("better-completion: an allocation is never malformed")
      end
    | has-unnecessary => second
    | malformed => raise("better-completion: an allocation is never malformed")
  end
end

check "better-completion: completed beats all-necessary, which beats has-unnecessary":
  better-completion(has-unnecessary, completed) is completed
  better-completion(all-necessary, has-unnecessary) is all-necessary
  better-completion(has-unnecessary, has-unnecessary) is has-unnecessary
  better-completion(malformed, completed) raises "never malformed"
end

fun get-dept(course-id :: String) -> String:
  doc: "extracts department name from course-id"
  string-substring(course-id, 0, DEPT-LENGTH)
end

check "get-dept: the first four characters, padding space included":
  get-dept("MATH 0100") is "MATH"
  get-dept("CSCI 0150") is "CSCI"
  get-dept("PHP  0060") is "PHP "
end

fun get-num(course-id :: String) -> Option<Number>:
  doc: "extracts number from course-id"
  if string-length(course-id) < COURSE-NAME-LENGTH:
    none
  else:
    string-to-number(string-substring(course-id, NUMBER-START, COURSE-NAME-LENGTH))
  end
end

check "get-num: the four digits as a number, none for a short name":
  get-num("MATH 0100") is some(0100)
  get-num("CSCI 0150") is some(0150)
  get-num("PHP  0060") is some(0060)
  get-num("PHP  0060123") is some(0060)
  get-num("MATHMATH 0100") is none
  get-num("MATH0100") is none
end

fun all-chars-in(candidate :: String, allowed :: String) -> Boolean:
  doc: "determines if every character of candidate appears in allowed"
  string-explode(candidate).all(lam(char :: String) -> Boolean: string-contains(allowed, char) end)
end

check "all-chars-in: false on any disallowed character, true for the empty string":
  all-chars-in("CSCI", UPPERCASE-LETTERS) is true
  all-chars-in("CS I", UPPERCASE-LETTERS) is false
  all-chars-in("", DIGITS) is true
end

fun well-formed-dept(dept :: String) -> Boolean:
  doc: "determines if dept is a well-formed department"
  all-chars-in(dept, UPPERCASE-LETTERS)
  or (all-chars-in(string-substring(dept, 0, DEPT-LENGTH - 1), UPPERCASE-LETTERS)
    and (string-substring(dept, DEPT-LENGTH - 1, DEPT-LENGTH) == " "))
end

check "well-formed-dept: only four letters, or three letters and a trailing space":
  well-formed-dept("CSCI") is true
  well-formed-dept("PHP ") is true
  well-formed-dept(" PHP") is false
  well-formed-dept("CS  ") is false
  well-formed-dept("C5CI") is false
end

fun well-formed-course(course :: String) -> Boolean:
  doc: "determines if course is a well-formed course name"
  (string-length(course) >= COURSE-NAME-LENGTH)
  and well-formed-dept(string-substring(course, 0, DEPT-LENGTH))
  and (string-substring(course, DEPT-LENGTH, NUMBER-START) == " ")
  and all-chars-in(string-substring(course, NUMBER-START, COURSE-NAME-LENGTH), DIGITS)
end

check "well-formed-course: checks the first nine characters and ignores any suffix":
  well-formed-course("CSCI 0190") is true
  well-formed-course("PHP  0060") is true
  well-formed-course("CSCI 2951-S") is true
  well-formed-course("CSCI 0190hahaha") is true
  well-formed-course("CSCI-0190") is false
  well-formed-course("CSCI 1.50") is false
  well-formed-course("CSCI 019") is false
end

fun well-formed(roster :: List<String>) -> Boolean:
  doc: "determines if every course in roster is well-formed"
  roster.all(well-formed-course)
end

check "well-formed: empty roster is fine, one bad name spoils the roster":
  well-formed(empty) is true
  well-formed([list: "MATH 0100", "CSCI 0150", "PHP  0060"]) is true
  well-formed([list: "MATH 0100", "CSCI 0150", "MATH0100", "PHP  0060"]) is false
end

fun drop-suffix(course :: String) -> String:
  doc: "removes everything after the course number"
  string-substring(course, 0, COURSE-NAME-LENGTH)
end

check "drop-suffix: keeps the first nine characters":
  drop-suffix("CSCI 0190hahaha") is "CSCI 0190"
  drop-suffix("CSCI 2951-S") is "CSCI 2951"
  drop-suffix("PHP  2630") is "PHP  2630"
end

fun keep-one-systems-course(roster :: List<String>) -> List<String>:
  doc: "keeps at most one of CSCI 0300 and CSCI 0330 in roster"
  if roster.member(SYSTEMS-COURSE):
    filter(lam(course): not(course == ALTERNATE-SYSTEMS-COURSE) end, roster)
  else:
    roster
  end
end

check "keep-one-systems-course: drops CSCI 0330 only when CSCI 0300 is there too":
  keep-one-systems-course([list: "CSCI 0330", "CSCI 0190", "CSCI 0300"])
    is [list: "CSCI 0190", "CSCI 0300"]
  keep-one-systems-course([list: "CSCI 0330", "CSCI 0190"]) is [list: "CSCI 0330", "CSCI 0190"]
  keep-one-systems-course(empty) is empty
end

fun approved-outside-course(course :: String) -> Boolean:
  doc: "determines if course is a non-CS course approved for the additional electives"
  cases (Option) get-num(course):
    | none => false
    | some(num) =>
      APPROVED-OUTSIDE-COURSES.member(course)
      or ((get-dept(course) == "MATH") and (num >= ONE-THOUSAND-LEVEL)
        and (num < TWO-THOUSAND-LEVEL))
  end
end

check "approved-outside-course: the Handbook list, plus every 1000-level MATH course":
  approved-outside-course("ENGN 1931") is true
  approved-outside-course("MATH 1999") is true
  approved-outside-course("MATH 2010") is false
end

fun concentration-course(course :: String) -> Boolean:
  doc: "determines if course could count toward some concentration requirement"
  CALCULUS-COURSES.member(course) or INTRO-COURSES.member(course)
  or MATH-FOUNDATION-COURSES.member(course) or LINEAR-ALGEBRA-COURSES.member(course)
  or approved-outside-course(course) or cs-at-least(course, SERIES-C-MIN-LEVEL)
end

check "concentration-course: named intro courses and approved outside courses count":
  concentration-course("CSCI 0190") is true
  concentration-course("CSCI 0100") is false
  concentration-course("PHP  2630") is true
end

fun not-yet-seen(roster :: List<String>, seen :: List<String>) -> List<String>:
  doc: "keeps the courses in roster that aren't in seen"
  filter(lam(course): not(seen.member(course)) end, roster)
end

check "not-yet-seen: removes seen courses and keeps the order":
  not-yet-seen([list: "MATH 0100", "CSCI 0150", "PHP  0060"], empty)
    is [list: "MATH 0100", "CSCI 0150", "PHP  0060"]
  not-yet-seen([list: "MATH 0100", "CSCI 0150", "PHP  0060"], [list: "CSCI 0150"])
    is [list: "MATH 0100", "PHP  0060"]
end

fun prereqs(roster :: List<String>, seen :: List<String>) -> {Boolean; List<String>}:
  doc: "satisfies the calculus prerequisite with one calculus course from roster"
  prereqs-in-roster = filter(lam(course): roster.member(course) end, CALCULUS-COURSES)
  cases (List) prereqs-in-roster:
    | empty => {false; seen}
    | link(calculus, _) => {true; link(calculus, seen)}
  end
end

check "prereqs: one calculus course satisfies it":
  prereqs(empty, empty) is {false; empty}
  prereqs([list: "MATH 0100"], empty) is {true; [list: "MATH 0100"]}
  prereqs([list: "PHP  0060"], empty) is {false; empty}
  prereqs([list: "MATH 0190", "MATH 0170"], empty) is {true; [list: "MATH 0170"]}
end

fun intro-math(roster :: List<String>, seen :: List<String>, math-order :: List<String>)
  -> {Boolean; List<String>}:
  doc: "satisfies the introductory math foundation with the first unseen course in math-order"
  valid-courses = not-yet-seen(roster, seen)
  cases (List) filter(lam(course): valid-courses.member(course) end, math-order):
    | empty => {false; seen}
    | link(foundation, _) => {true; link(foundation, seen)}
  end
end

check "intro-math: takes the first course of math-order that the roster has":
  intro-math([list: "CSCI 0220", "MATH 1530"], empty, MATH-FOUNDATION-COURSES)
    is {true; [list: "CSCI 0220"]}
  intro-math([list: "CSCI 0220", "MATH 1530"], empty, MATH-FOUNDATION-COURSES.reverse())
    is {true; [list: "MATH 1530"]}
  intro-math([list: "MATH 1530"], empty, MATH-FOUNDATION-COURSES) is {true; [list: "MATH 1530"]}
  intro-math([list: "MATH 1500"], empty, MATH-FOUNDATION-COURSES) is {false; empty}
end

fun has-course(course :: String, roster :: List<String>, seen :: List<String>)
  -> {Boolean; List<String>}:
  doc: "determines if course is in roster and not yet seen, adding it to seen if so"
  if roster.member(course) and not(seen.member(course)):
    {true; link(course, seen)}
  else:
    {false; seen}
  end
end

check "has-course: true only for a course on the roster and not yet seen":
  has-course("CSCI 0220", empty, empty) is {false; empty}
  has-course("MATH 1530", [list: "CSCI 0200", "MATH 1530"], empty) is {true; [list: "MATH 1530"]}
  has-course("CSCI 0190", [list: "CSCI 0190"], [list: "CSCI 0190"]) is {false; [list: "CSCI 0190"]}
end

fun foundations(roster :: List<String>, seen :: List<String>) -> {Boolean; List<String>}:
  doc: "determines if roster satisfies cs foundations requirements"
  valid-courses = not-yet-seen(roster, seen)
  {has-a; seen-a} = has-course("CSCI 0500", valid-courses, seen)
  {has-b; seen-b} = has-course("CSCI 0410", valid-courses, seen-a)
  {has-c1; seen-c1} = has-course(SYSTEMS-COURSE, valid-courses, seen-b)
  {has-c2; seen-c2} = has-course(ALTERNATE-SYSTEMS-COURSE, valid-courses, seen-b)

  ask:
    | has-a and has-b and has-c1 then: {true; seen-c1}
    | has-a and has-b and has-c2 then: {true; seen-c2}
    | has-c1 then: {false; seen-c1}
    | otherwise: {false; seen-c2}
  end
end

check "foundations: CSCI 0500, CSCI 0410, and one of CSCI 0300 and CSCI 0330":
  foundations([list: "CSCI 0500", "CSCI 0410", "CSCI 0300"], empty)
    is {true; [list: "CSCI 0300", "CSCI 0410", "CSCI 0500"]}
  foundations([list: "CSCI 0500", "CSCI 0410", "CSCI 0330"], empty)
    is {true; [list: "CSCI 0330", "CSCI 0410", "CSCI 0500"]}
  foundations([list: "CSCI 0500", "CSCI 0410"], empty)
    is {false; [list: "CSCI 0410", "CSCI 0500"]}
  foundations([list: "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 0330"], empty)
    is {true; [list: "CSCI 0300", "CSCI 0410", "CSCI 0500"]}
  foundations([list: "CSCI 0500", "CSCI 0300"], empty)
    is {false; [list: "CSCI 0300", "CSCI 0500"]}
  foundations([list: "CSCI 0500", "CSCI 0410", "CSCI 0300"], [list: "CSCI 0500"])
    is {false; [list: "CSCI 0300", "CSCI 0410", "CSCI 0500"]}
end

fun cs-at-least(course :: String, level :: Number) -> Boolean:
  doc: "determines if course is a CSCI course numbered level or higher"
  cases (Option) get-num(course):
    | none => false
    | some(num) => (get-dept(course) == "CSCI") and (num >= level)
  end
end

check "cs-at-least: CSCI courses only, and the level itself counts":
  cs-at-least("CSCI 0500", 500) is true
  cs-at-least("MATH 0500", 500) is false
  cs-at-least("CSCI 0499", 500) is false
  cs-at-least("MATH 0499", 500) is false
end

fun core-cs(roster :: List<String>, seen :: List<String>) -> {Boolean; List<String>}:
  doc: "determines if roster satisfies the intro sequence, except the Series C extra course"
  valid-courses = not-yet-seen(roster, seen)
  {has-111; seen-111} = has-course("CSCI 0111", valid-courses, seen)
  {has-150; seen-150} = has-course("CSCI 0150", valid-courses, seen)
  {has-170; seen-170} = has-course("CSCI 0170", valid-courses, seen)
  {has-190; seen-190} = has-course("CSCI 0190", valid-courses, seen)
  {has-200; seen-200} = has-course("CSCI 0200", valid-courses, seen)

  ask:
    | has-111 and has-200 then: {true; link("CSCI 0111", link("CSCI 0200", seen))}
    | has-150 and has-200 then: {true; link("CSCI 0150", link("CSCI 0200", seen))}
    | has-170 and has-200 then: {true; link("CSCI 0170", link("CSCI 0200", seen))}
    | has-190 then: {true; seen-190}
    | has-111 then: {false; seen-111}
    | has-150 then: {false; seen-150}
    | has-170 then: {false; seen-170}
    | has-200 then: {false; seen-200}
    | otherwise: {false; seen}
  end
end

check "core-cs: an intro course with CSCI 0200, or CSCI 0190 alone":
  core-cs([list: "CSCI 0111", "CSCI 0200"], empty) is {true; [list: "CSCI 0111", "CSCI 0200"]}
  core-cs([list: "CSCI 0150", "CSCI 0200"], empty) is {true; [list: "CSCI 0150", "CSCI 0200"]}
  core-cs([list: "CSCI 0170", "CSCI 0200"], empty) is {true; [list: "CSCI 0170", "CSCI 0200"]}
  core-cs([list: "CSCI 0190", "CSCI 0200"], empty) is {true; [list: "CSCI 0190"]}
  core-cs([list: "CSCI 0190"], empty) is {true; [list: "CSCI 0190"]}
  core-cs([list: "CSCI 0150", "CSCI 0190", "CSCI 0200"], empty)
    is {true; [list: "CSCI 0150", "CSCI 0200"]}
  core-cs([list: "CSCI 1010"], empty) is {false; empty}
end

fun series-c-extra(roster :: List<String>, seen :: List<String>) -> {Boolean; List<String>}:
  doc: "fills the Series C extra course slot, which exists only once CSCI 0190 is in seen"
  if seen.member("CSCI 0190"):
    cases (List) filter(lam(course): cs-at-least(course, SERIES-C-MIN-LEVEL) end,
        not-yet-seen(roster, seen)):
      | empty => {false; seen}
      | link(extra, _) => {true; link(extra, seen)}
    end
  else:
    {true; seen}
  end
end

check "series-c-extra: takes an unseen CSCI course from 200 up, only on Series C":
  series-c-extra([list: "CSCI 0190", "CSCI 0320", "CSCI 0530"], [list: "CSCI 0320", "CSCI 0190"])
    is {true; [list: "CSCI 0530", "CSCI 0320", "CSCI 0190"]}
  series-c-extra([list: "CSCI 0190", "CSCI 0111", "APMA 1080"], [list: "CSCI 0190"])
    is {false; [list: "CSCI 0190"]}
  series-c-extra([list: "CSCI 0150", "CSCI 0200", "CSCI 1300"], [list: "CSCI 0150", "CSCI 0200"])
    is {true; [list: "CSCI 0150", "CSCI 0200"]}
end

fun tech-elec(roster :: List<String>, seen :: List<String>) -> {Boolean; List<String>}:
  doc: "fills the technical elective slots with unseen technical CSCI courses from 1000 up"
  technical-courses = sort(filter(lam(course): cs-at-least(course, ONE-THOUSAND-LEVEL)
      and not(NON-TECHNICAL-COURSES.member(course)) end, not-yet-seen(roster, seen)))
  if technical-courses.length() >= TECHNICAL-ELECTIVE-COUNT:
    {true; technical-courses.take(TECHNICAL-ELECTIVE-COUNT) + seen}
  else:
    {false; technical-courses + seen}
  end
end

check "tech-elec: the first five unseen technical courses, never non-technical ones":
  tech-elec([list: "CSCI 1000", "CSCI 5000", "CSCI 1010", "CSCI 2000", "CSCI 5555"], empty)
    is {true; [list: "CSCI 1000", "CSCI 1010", "CSCI 2000", "CSCI 5000", "CSCI 5555"]}
  tech-elec([list: "CSCI 1000", "CSCI 5000", "CSCI 1010", "CSCI 2000", "CSCI 5555"],
    [list: "CSCI 1000"])
    is {false; [list: "CSCI 1010", "CSCI 2000", "CSCI 5000", "CSCI 5555", "CSCI 1000"]}
  tech-elec([list: "CSCI 1000", "CSCI 5000", "CSCI 1010", "CSCI 2000", "CSCI 5555", "CSCI 1234"],
    [list: "CSCI 1000"])
    is {true; [list: "CSCI 1010", "CSCI 1234", "CSCI 2000", "CSCI 5000", "CSCI 5555", "CSCI 1000"]}
  tech-elec(empty, empty) is {false; empty}
  tech-elec([list: "CSCI 1250", "CSCI 2200", "CSCI 1000"], empty) is {false; [list: "CSCI 1000"]}
end

fun four-add(roster :: List<String>, seen :: List<String>) -> {Boolean; List<String>}:
  doc: "fills the additional elective slots, trying linear algebra and outside courses first"
  valid-courses = not-yet-seen(roster, seen)
  cs-courses =
    sort(filter(lam(course): cs-at-least(course, ONE-THOUSAND-LEVEL) end, valid-courses))
  outside-courses = sort(filter(approved-outside-course, valid-courses))
  independent-studies =
    filter(lam(course): valid-courses.member(course) end, INDEPENDENT-STUDY-COURSES)
  electives = linear-algebra-elective(valid-courses) + use-non-cs-1000(outside-courses, 0, false)
    + software-engineering-elective(valid-courses) + use-cs-1000(cs-courses, 0)
    + independent-studies
  if electives.length() >= ADDITIONAL-ELECTIVE-COUNT:
    {true; electives.take(ADDITIONAL-ELECTIVE-COUNT)}
  else:
    {false; electives}
  end
end

check "four-add: four additional electives, linear algebra and outside courses first":
  four-add([list: "CSCI 0320", "CSCI 1000", "CSCI 5000", "CSCI 1010"], empty)
    is {true; [list: "CSCI 0320", "CSCI 1000", "CSCI 1010", "CSCI 5000"]}
  four-add([list: "CSCI 0320", "CSCI 1000", "MATH 0520", "MATH 0540"], empty)
    is {false; [list: "MATH 0520", "CSCI 0320", "CSCI 1000"]}
  four-add([list: "CSCI 0320", "CSCI 1000", "CSCI 5000", "CSCI 1010", "MATH 0520", "MATH 0540"],
    empty) is {true; [list: "MATH 0520", "CSCI 0320", "CSCI 1000", "CSCI 1010"]}
  four-add([list: "CSCI 0320", "CSCI 1000", "APMA 1650", "APMA 1655"], empty)
    is {false; [list: "APMA 1650", "CSCI 0320", "CSCI 1000"]}
  four-add([list: "CSCI 0320", "CSCI 1970", "CSCI 1973", "CSCI 1000"], empty)
    is {true; [list: "CSCI 0320", "CSCI 1000", "CSCI 1970", "CSCI 1973"]}
  four-add([list: "CSCI 1973", "CSCI 0320"], empty) is {false; [list: "CSCI 0320", "CSCI 1973"]}
  four-add([list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1370"], empty)
    is {false; [list: "CSCI 1250", "CSCI 1280", "CSCI 1360"]}
end

fun linear-algebra-elective(courses :: List<String>) -> List<String>:
  doc: "the first linear algebra course that courses has, since only one counts"
  cases (List) filter(lam(course): courses.member(course) end, LINEAR-ALGEBRA-COURSES):
    | empty => empty
    | link(linear-algebra, _) => [list: linear-algebra]
  end
end

check "linear-algebra-elective: at most one course, in the order MATH 0520, 0540, APMA 0260":
  linear-algebra-elective([list: "APMA 0260", "MATH 0540", "MATH 0520"]) is [list: "MATH 0520"]
  linear-algebra-elective([list: "APMA 0260", "MATH 0540"]) is [list: "MATH 0540"]
  linear-algebra-elective([list: "APMA 0260", "CSCI 0320"]) is [list: "APMA 0260"]
  linear-algebra-elective(empty) is empty
end

fun software-engineering-elective(courses :: List<String>) -> List<String>:
  doc: "CSCI 0320 if courses has it"
  if courses.member(SOFTWARE-ENGINEERING-COURSE):
    [list: SOFTWARE-ENGINEERING-COURSE]
  else:
    empty
  end
end

check "software-engineering-elective: CSCI 0320 or nothing":
  software-engineering-elective([list: "MATH 0520", "CSCI 0320"]) is [list: "CSCI 0320"]
  software-engineering-elective([list: "CSCI 0330"]) is empty
end

fun use-cs-1000(cs-courses :: List<String>, num-non-tech :: Number) -> List<String>:
  doc: "keeps the CSCI courses that can be additional electives, at most three non-technical"
  cases (List) cs-courses:
    | empty => empty
    | link(course, rest-courses) =>
      ask:
        | INDEPENDENT-STUDY-COURSES.member(course) then:
          use-cs-1000(rest-courses, num-non-tech)
        | not(NON-TECHNICAL-COURSES.member(course)) then:
          link(course, use-cs-1000(rest-courses, num-non-tech))
        | num-non-tech < NON-TECHNICAL-CAP then:
          link(course, use-cs-1000(rest-courses, num-non-tech + 1))
        | otherwise:
          use-cs-1000(rest-courses, num-non-tech)
      end
  end
end

check "use-cs-1000: at most three non-technical courses, and no independent studies":
  use-cs-1000(NON-TECHNICAL-COURSES, 3) is empty
  use-cs-1000(NON-TECHNICAL-COURSES, 0) is [list: "CSCI 1250", "CSCI 1280", "CSCI 1360"]
  use-cs-1000([list: "CSCI 1250", "CSCI 1000", "CSCI 1001"], 3) is [list: "CSCI 1000", "CSCI 1001"]
  use-cs-1000([list: "CSCI 1250", "CSCI 1000", "CSCI 1001"], 0)
    is [list: "CSCI 1250", "CSCI 1000", "CSCI 1001"]
  use-cs-1000([list: "CSCI 1000", "CSCI 1970"], 0) is [list: "CSCI 1000"]
end

fun use-non-cs-1000(
    outside-courses :: List<String>, num-used :: Number, used-apma-165x :: Boolean)
  -> List<String>:
  doc: "keeps at most three approved outside courses, with only one of APMA 1650 and 1655"
  cases (List) outside-courses:
    | empty => empty
    | link(course, rest-courses) =>
      if (num-used >= OUTSIDE-COURSE-CAP) or not(approved-outside-course(course))
        or (used-apma-165x and APMA-165X-COURSES.member(course)):
        use-non-cs-1000(rest-courses, num-used, used-apma-165x)
      else:
        link(course, use-non-cs-1000(rest-courses, num-used + 1,
            used-apma-165x or APMA-165X-COURSES.member(course)))
      end
  end
end

check "use-non-cs-1000: at most three courses, and one of APMA 1650 and 1655":
  use-non-cs-1000(APPROVED-OUTSIDE-COURSES, 3, false) is empty
  use-non-cs-1000(APPROVED-OUTSIDE-COURSES, 1, false) is [list: "APMA 1080", "APMA 1160"]
  use-non-cs-1000([list: "APMA 1650", "CLPS 1342"], 2, true) is [list: "CLPS 1342"]
  use-non-cs-1000([list: "APMA 1655", "APMA 1650"], 1, false) is [list: "APMA 1655"]
end
