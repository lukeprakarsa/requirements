use context starter2024

include file("reqs-common.arr")
provide *

### DO NOT EDIT ANYTHING ABOVE THIS LINE ###

fun check-reqs(roster :: List<String>) -> Completion:
  doc: "https://cs.brown.edu/courses/csci0190/2026/reqs-1.html"
  if not(well-formed(roster)):
    malformed
  else:
    completed
  end
#   seen = empty
#   {} = prereqs(roster, seen)
end

fun get-dept(course-id :: String) -> String:
  doc: "extracts department name from course-id"
  string-substring(course-id, 0, 4)
end

check "get-dept":
  get-dept("MATH 0100") is "MATH"
  get-dept("CSCI 0150") is "CSCI"
  get-dept("PHP  0060") is "PHP "
end

# catches the case in which the dept is wrong
fun get-num(course-id :: String) -> Option<Number>:
  doc: "extracts number from course-id"
  string-to-number(string-substring(course-id, 5, 9))
end

check "get-num":
  get-num("MATH 0100") is some(0100)
  get-num("CSCI 0150") is some(0150)
  get-num("PHP  0060") is some(0060)
  get-num("MATHMATH 0100") is none
end

fun well-formed(roster :: List<String>) -> Boolean:
  doc: "determines if all courses listed in roster are correctly formed"
  cases (List) roster:
    | empty => true
    | link(_, _) =>
      fold(lam(acc, c): bueno(c) and acc end, true, roster)
  end
end

check "well-formed":
  well-formed(empty) is true
  well-formed([list: "MATH 0100", "CSCI 0150", "PHP  0060", "MATHMATH 0100"]) is false
  well-formed([list: "MATH 0100", "CSCI 0150", "PHP  0060"]) is true
end

fun bueno(course-id :: String) -> Boolean:
  doc: "determines if a course if well formed"
  is-some(get-num(course-id))
end

check "bueno":
  bueno("MATH 0100") is true
  bueno("MATHMATH 0100") is false
  bueno("PHP  0060") is true
end

fun not-yet-seen(roster :: List<String>, seen :: List<String>) -> List<String>:
  doc: "gives a list out of courses in roster that are not yet seen"
  filter(lam(c): not(seen.member(c)) end, roster)
end

check "not-yet-seen":
  not-yet-seen([list: "MATH 0100", "CSCI 0150", "PHP  0060"], empty) 
    is [list: "MATH 0100", "CSCI 0150", "PHP  0060"]
  not-yet-seen([list: "MATH 0100", "CSCI 0150", "PHP  0060"], [list: "CSCI 0150"]) 
    is [list: "MATH 0100", "PHP  0060"]
end

fun prereqs(roster :: List<String>, seen :: List<String>) -> {Boolean; List<String>}:
  doc: "determines if roster satisfies prequisites"
  courses-needed = [list: "MATH 0100", "MATH 0170", "MATH 0190"]
  prereqs-in-roster = filter(lam(c): roster.member(c) end, courses-needed)
  cases (List) prereqs-in-roster:
    | empty => {false; seen}
    | link(_, _) => {true; prereqs-in-roster}
  end
end

check "prereqs":
  prereqs(empty, empty) is {false; empty}
  prereqs([list: "MATH 0100"], empty) is {true; [list: "MATH 0100"]}
  prereqs([list: "PHP  0060"], empty) is {false; empty}
end