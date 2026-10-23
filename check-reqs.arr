use context starter2024

include file("reqs-common.arr")
provide *

### DO NOT EDIT ANYTHING ABOVE THIS LINE ###
#|
fun check-reqs(roster :: List<String>) -> Completion:
  doc: "https://cs.brown.edu/courses/csci0190/2026/reqs-1.html"
  
  if not(well-formed(roster)):
    malformed
  end
  
  if roster.length() == 0:
    all-necessary
    # is this ok and does it mess up "order of precedence"
  end
  
  seen = empty
  
  {prereqs-sat; prereqs-seen} = prereqs(roster, seen)
  {intro-math-sat; intro-math-seen} = intro-math(roster, prereqs-seen)
  {foundations-sat; foundations-seen} = foundations(roster, intro-math-seen)
  {core-cs-sat; core-cs-seen} = core-cs(roster, foundations-seen)
  {tech-elec-sat; tech-elect-seen} = tech-elec(roster, core-cs-seen)
  {four-add-sat; four-add-seen} = four-add(roster, tech-elect-seen)
  
  if prereqs-sat and intro-math-sat and foundations-sat and 
    core-cs-sat and tech-elec-sat and four-add-sat:
    completed
  end
  
  if not(is-empty(not-yet-seen(roster, four-add-seen))):
    has-unnecessary
  else:
    all-necessary
  end

  # should check foundations before the cs19 -> 200+ track

  # prereqs - check!
  # intro math
  # foundations
  # core-cs
  # technical electives
  # four additional electives

  # !!!!!! consider asteriks !!!!!!!!
  # !!!!!! consider cs nontechnical courses !!!!!!!

end
|#

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
  get-num("PHP  0060123") is some(0060)
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

fun intro-math(roster :: List<String>, seen :: List<String>) -> {Boolean; List<String>}:
  doc: "determines if roster satisfies introductory math foundations"
  valid-courses = not-yet-seen(roster, seen)
  ask:
    | valid-courses.member("CSCI 0220") then: {true; link("CSCI 0220", seen)}
    | valid-courses.member("MATH 1530") then: {true; link("MATH 1530", seen)}
    | otherwise: {false; seen}
  end
end

check "intro-math":
  intro-math([list: "CSCI 0220"], empty) is {true; [list: "CSCI 0220"]}
  intro-math([list: "MATH 1530"], empty) is {true; [list: "MATH 1530"]}
  intro-math([list: "MATH 1500"], empty) is {false; empty}
end

fun has-course(course :: String, roster :: List<String>, seen :: List<String>) 
  -> {Boolean; List<String>}:
  doc: "determines if a course can be used to satisfy concentration reqs"
  if roster.member(course) and not(seen.member(course)):
    {true; link(course, seen)}
  else:
    {false; seen}
  end
end

check "has-course":
  has-course("CSCI 0220", empty, empty) is {false; empty}
  has-course("MATH 1530", [list: "CSCI 0200", "MATH 1530"], empty) is {true; [list: "MATH 1530"]}
  has-course("CSCI 0190", [list: "CSCI 0190"], [list: "CSCI 0190"]) is {false; [list: "CSCI 0190"]}
end

fun foundations(roster :: List<String>, seen :: List<String>) -> {Boolean; List<String>}:
  doc: "determines if roster satisfies cs foundations requirements"
  valid-courses = not-yet-seen(roster, seen)
  {has-a; seen-a} = has-course("CSCI 0500", valid-courses, seen)
  {has-b; seen-b} = has-course("CSCI 0410", valid-courses, seen-a)
  {has-c1; seen-c1} = has-course("CSCI 0300", valid-courses, seen-b)
  {has-c2; seen-c2} = has-course("CSCI 0330", valid-courses, seen-b)
  
  ask:
      #happy cases
    | has-a and has-b and has-c1 then: {true; seen-c1}
    | has-a and has-b and has-c2 then: {true; seen-c2}
      #sad cases
    | has-c1 then: {false; seen-c1}
    | otherwise: {false; seen-c2}
  end
end

check "foundations":
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

fun cs-greater-than(course :: String, level :: Number) -> Boolean:
  doc: "determines if a course is in cs and is of level 200 plus"
  has-name = get-dept(course) == "CSCI"
  cases (Option) get-num(course):
    | none => false
    | some(v) => has-name and (v >= level) 
  end
end

fun core-cs(roster :: List<String>, seen :: List<String>) -> {Boolean; List<String>}:
  doc: "determines if roster satisfies core cs requirements"
  valid-courses = not-yet-seen(roster, seen)
  {has-111; seen-111} = has-course("CSCI 0111", valid-courses, seen)
  {has-150; seen-150} = has-course("CSCI 0150", valid-courses, seen)
  {has-170; seen-170} = has-course("CSCI 0170", valid-courses, seen)
  {has-190; seen-190} = has-course("CSCI 0190", valid-courses, seen)
  {has-200; seen-200} = has-course("CSCI 0200", valid-courses, seen)

  all-200-plus = sort(filter(lam(course): cs-greater-than(course, 200) end, valid-courses))
  
  has-200-plus = not(is-empty(all-200-plus))
    
  ask:
      # happy cases
    | has-111 and has-200 then: {true; link("CSCI 0111", link("CSCI 0200", seen))}
    | has-150 and has-200 then: {true; link("CSCI 0150", link("CSCI 0200", seen))}
    | has-170 and has-200 then: {true; link("CSCI 0170", link("CSCI 0200", seen))}
    | has-190 and has-200-plus then: {true; link("CSCI 0190", link(all-200-plus.get(0), seen))}
      # sad cases
    | has-111 then: {false; seen-111}
    | has-150 then: {false; seen-150}
    | has-170 then: {false; seen-170}
    | has-190 then: {false; seen-190}
    | has-200 then: {false; seen-200}
    | has-200-plus then: {false; link(all-200-plus.get(0), seen)}
    | otherwise: {false; seen}
  end
end

check "core-cs":
  core-cs([list: "CSCI 0111", "CSCI 0200"], empty) is {true; [list: "CSCI 0111", "CSCI 0200"]}
  core-cs([list: "CSCI 0150", "CSCI 0200"], empty) is {true; [list: "CSCI 0150", "CSCI 0200"]}
  core-cs([list: "CSCI 0170", "CSCI 0200"], empty) is {true; [list: "CSCI 0170", "CSCI 0200"]}
  core-cs([list: "CSCI 0190", "CSCI 0200"], empty) is {true; [list: "CSCI 0190", "CSCI 0200"]}
  core-cs([list: "CSCI 0190", "CSCI 2000"], empty) is {true; [list: "CSCI 0190", "CSCI 2000"]}
  core-cs([list: "CSCI 0190"], empty) is {false; [list: "CSCI 0190"]}
end

fun tech-elec(roster :: List<String>, seen :: List<String>) -> {Boolean; List<String>}:
  doc: "determines if the roster satisfied technical elective requirements"
  valid-courses = not-yet-seen(roster, seen)
  all-1000-plus = sort(filter(lam(course): cs-greater-than(course, 1000) end, valid-courses))
  
  has-five = all-1000-plus.length() >= 5
  has-at-least-one = all-1000-plus.length() > 0
  
  ask:
    | has-five then: {true; all-1000-plus.take(5) + seen}
    | has-at-least-one then: {false; all-1000-plus.take(all-1000-plus.length()) + seen}
    | otherwise: {false; seen}
  end
end

check "tech-elec":
  tech-elec([list: "CSCI 1000", "CSCI 5000", "CSCI 1010", "CSCI 2000", "CSCI 5555"], empty)
    is {true; [list: "CSCI 1000", "CSCI 1010", "CSCI 2000", "CSCI 5000", "CSCI 5555"]}
  tech-elec([list: "CSCI 1000", "CSCI 5000", "CSCI 1010", "CSCI 2000", "CSCI 5555"], 
    [list: "CSCI 1000"])
    is {false; [list: "CSCI 1010", "CSCI 2000", "CSCI 5000", "CSCI 5555", "CSCI 1000"]}
  tech-elec([list: "CSCI 1000", "CSCI 5000", "CSCI 1010", "CSCI 2000", "CSCI 5555", "CSCI 1234"], 
    [list: "CSCI 1000"])
    is {true; [list: "CSCI 1010", "CSCI 1234", "CSCI 2000", "CSCI 5000", "CSCI 5555", "CSCI 1000"]}
  tech-elec(empty, empty) is {false; empty}
end
