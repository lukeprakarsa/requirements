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

  # prereqs - done!
  # intro math - done
  # foundations - done
  # core-cs - done
  # technical electives - done
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

fun cs-at-least(course :: String, level :: Number) -> Boolean:
  doc: "determines if a course is in cs and is a greater than or equal to level"
  has-name = get-dept(course) == "CSCI"
  cases (Option) get-num(course):
    | none => false
    | some(v) => has-name and (v >= level) 
  end
end

check "cs-at-least":
  cs-at-least("CSCI 0500", 500) is true
  cs-at-least("MATH 0500", 500) is false
  cs-at-least("CSCI 0499", 500) is false
  cs-at-least("MATH 0499", 500) is false
end

fun core-cs(roster :: List<String>, seen :: List<String>) -> {Boolean; List<String>}:
  doc: "determines if roster satisfies core cs requirements"
  valid-courses = not-yet-seen(roster, seen)
  {has-111; seen-111} = has-course("CSCI 0111", valid-courses, seen)
  {has-150; seen-150} = has-course("CSCI 0150", valid-courses, seen)
  {has-170; seen-170} = has-course("CSCI 0170", valid-courses, seen)
  {has-190; seen-190} = has-course("CSCI 0190", valid-courses, seen)
  {has-200; seen-200} = has-course("CSCI 0200", valid-courses, seen)

  all-200-plus = sort(filter(lam(course): cs-at-least(course, 200) end, valid-courses))

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
  doc: "determines if the roster satisfies technical elective requirements"
  valid-courses = not-yet-seen(roster, seen)
  all-1000-plus = sort(filter(lam(course): cs-at-least(course, 1000) end, valid-courses))

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

fun four-add(roster :: List<String>, seen :: List<String>) -> {Boolean; List<String>}:
  doc: "determines if the roster satisfies the four additional electives requirements"
  valid-courses = not-yet-seen(roster, seen)
  cs-all-1000-plus = sort(filter(lam(course): cs-at-least(course, 1000) end, valid-courses))
  non-cs-all-1000-plus = 
    sort(filter(lam(course): non-cs-at-least(course, 1000) end, valid-courses))

  has-320 = has-course("CSCI 0320", roster, seen).{0}

  has-520 = has-course("MATH 0520", roster, seen).{0}
  has-540 = has-course("MATH 0540", roster, seen).{0}
  has-260 = has-course("APMA 0260", roster, seen).{0}

  useable-cs-1000 = use-cs-1000(cs-all-1000-plus, 0)
  useable-non-cs-1000 = use-non-cs-1000(non-cs-all-1000-plus, 0, false)

  instances-1970 = filter(lam(course): course == "CSCI 1970" end, valid-courses)
  instances-1973 = filter(lam(course): course == "CSCI 1973" end, valid-courses)

  electives-cs-320 = update-electives-320(has-320)
  electives-linear = update-electives-linear(has-520, has-540, has-260, electives-cs-320)
  electives-1000 = electives-linear + useable-cs-1000 + useable-non-cs-1000
  electives-197x = update-electives-197x(instances-1970, instances-1973, electives-1000)

  ask: 
    | electives-197x.length() >= 4 then:
      {true; electives-197x.take(4)}
    | otherwise: 
      {false; electives-197x.take(electives-197x.length())}
  end
end

check "four-add":
  four-add([list: "CSCI 0320", "CSCI 1000", "CSCI 5000", "CSCI 1010"], empty) 
    is {true; [list: "CSCI 0320", "CSCI 1000", "CSCI 1010", "CSCI 5000"]}
  four-add([list: "CSCI 0320", "CSCI 1000", "MATH 0520", "MATH 0540"], empty) 
    is {false; [list: "CSCI 0320", "MATH 0520", "CSCI 1000"]}
  four-add([
      list: "CSCI 0320", "CSCI 1000", "CSCI 5000", "CSCI 1010", "MATH 0520", "MATH 0540"], empty) 
    is {true; [list: "CSCI 0320", "MATH 0520", "CSCI 1000", "CSCI 1010"]}
  four-add([list: "CSCI 0320", "CSCI 1000", "APMA 1650", "APMA 1655"], empty) 
    is {false; [list: "CSCI 0320", "CSCI 1000", "APMA 1650"]}
  four-add([list: "CSCI 0320", "CSCI 1970", "CSCI 1970", "CSCI 1973"], empty) 
    is {false; [list: "CSCI 0320", "CSCI 1970", "CSCI 1970"]}
  four-add([list: "CSCI 0320", "CSCI 1970", "CSCI 1970", "CSCI 1973", "CSCI 1000"], empty) 
    is {true; [list: "CSCI 0320", "CSCI 1000", "CSCI 1970", "CSCI 1970"]}
  four-add([list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1370"], empty)
    is {false; [list: "CSCI 1250", "CSCI 1280", "CSCI 1360"]}
end

fun update-electives-320(has-320 :: Boolean) -> List<String>:
  doc: "creates a list of the class if CSCI 0320 is had"
  if has-320: [list: "CSCI 0320"]
  else: empty
  end
end

check "update-electives-320":
  update-electives-320(true) is [list: "CSCI 0320"]
  update-electives-320(false) is empty
end

fun update-electives-linear(
    has-520 :: Boolean, has-540 :: Boolean, has-260 :: Boolean, electives :: List<String>)
  -> List<String>:
  doc: "adds to the list of used electives one of the linear classes"
  ask:
    | has-520 then: electives + [list: "MATH 0520"]
    | has-540 then: electives + [list:"MATH 0540"]
    | has-260 then: electives + [list:"APMA 0260"]
    | otherwise: electives
  end
end

check "update-electives-linear":
  update-electives-linear(true, true, true, empty) is [list: "MATH 0520"]
  update-electives-linear(false, true, true, empty) is [list: "MATH 0540"]
  update-electives-linear(false, false, true, empty) is [list: "APMA 0260"]
  update-electives-linear(false, false, false, empty) is empty
end

fun update-electives-197x(
    instances-1970 :: List<String>, instances-1973 :: List<String>, electives :: List<String>)
  -> List<String>:
  doc: "adds to the list of used electives a valid combination of cs 197x classes"
  ask:
    | instances-1970.length() >= 2 then: electives + instances-1970.take(2)
    | instances-1973.length() >= 2 then: electives + instances-1973.take(2)
    | ((1 <= instances-1970.length()) and (1 <= instances-1973.length()))
      then: electives + instances-1970.take(1) + instances-1973.take(1)
    | 1 <= instances-1970.length()
      then: electives + instances-1970.take(1) 
    | 1 <= instances-1973.length()
      then: electives + instances-1973.take(1)
    | otherwise: electives
  end
end

check "update-electives-197x":
  update-electives-197x([list: "CSCI 1970", "CSCI 1970"], empty, empty) 
    is [list: "CSCI 1970", "CSCI 1970"]
  update-electives-197x(empty, [list: "CSCI 1973", "CSCI 1973"], empty) 
    is [list: "CSCI 1973", "CSCI 1973"]
  update-electives-197x([list: "CSCI 1970"], [list: "CSCI 1973"], empty) 
    is [list: "CSCI 1970", "CSCI 1973"]
  update-electives-197x([list: "CSCI 1970"], empty, empty) 
    is [list: "CSCI 1970"]
  update-electives-197x(empty, [list: "CSCI 1973"], empty) 
    is [list: "CSCI 1973"]
  update-electives-197x(empty, empty, empty) 
    is empty
end

fun bool-to-num(b :: Boolean) -> Number:
  doc: "1 if true, 0 if false"
  if b: 1
  else: 0
  end
end

check "bool-to-num":
  bool-to-num(true) is 1
  bool-to-num(false) is 0
end

fun use-cs-1000(all-1000 :: List<String>, num-non-tech :: Number) 
  -> List<String>:
  doc: "returns list of 1000 level CS courses that can be used for four-add"

  cs-non-tech = [list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1370", 
    "CSCI 1800", "CSCI 1805", "CSCI 1860", "CSCI 1870", 
    "CSCI 1952B", "CSCI 1952X", "CSCI 2002", "CSCI 2200", 
    "CSCI 2402C", "CSCI 2952S", "CSCI 2999A", "APMA 1910", 
    "DEVL 1810", "IAPA 1701A", "IAPA 1801", "PLCY 1702X"]

  cases (List) all-1000:
    | empty => empty
    | link(f,r) => 
      ask:
        | (f == "CSCI 1970") or (f == "CSCI 1973") then:
          use-cs-1000(r, num-non-tech)
        | cs-non-tech.member(f) and (num-non-tech < 3) then: 
          link(f, use-cs-1000(r, num-non-tech + 1))
        | cs-non-tech.member(f) and (num-non-tech >= 3) then:
          use-cs-1000(r, num-non-tech)
        | otherwise: 
          link(f, use-cs-1000(r, num-non-tech))
      end
  end
end

check "use-cs-1000":
  cs-non-tech = [list: "CSCI 1250", "CSCI 1280", "CSCI 1360", "CSCI 1370", 
    "CSCI 1800", "CSCI 1805", "CSCI 1860", "CSCI 1870", 
    "CSCI 1952B", "CSCI 1952X", "CSCI 2002", "CSCI 2200", 
    "CSCI 2402C", "CSCI 2952S", "CSCI 2999A", "APMA 1910", 
    "DEVL 1810", "IAPA 1701A", "IAPA 1801", "PLCY 1702X"]
  use-cs-1000(cs-non-tech, 3) is empty
  use-cs-1000(cs-non-tech, 0) is [list: "CSCI 1250", "CSCI 1280", "CSCI 1360"]

  use-cs-1000([list: "CSCI 1250", "CSCI 1000", "CSCI 1001"], 3) is [list: "CSCI 1000", "CSCI 1001"]
  use-cs-1000([list: "CSCI 1250", "CSCI 1000", "CSCI 1001"], 0) 
    is [list: "CSCI 1250", "CSCI 1000", "CSCI 1001"]
end

fun use-non-cs-1000(all-1000 :: List<String>, num-used :: Number, used-apma-165x :: Boolean) 
  -> List<String>:
  doc: "returns list of 1000 level non-CS courses that can be used for four-add"

  eligible-courses = [list: "APMA 1080", "APMA 1160", "APMA 1690", "APMA 1170", "APMA 1200", 
    "APMA 1210", "APMA 1360", "APMA 1650", "APMA 1655", "APMA 1660", "APMA 1670", "APMA 1710", 
    "APMA 1720", "APMA 1740", "APMA 1910", "APMA 1930W", "APMA 1930X", "APMA 2822B", "PHP 2630",
    "PHP 2650", "CLPS 1211", "CLPS 1291", "CLPS 1342", "CLPS 1350", "CLPS 1491", "CLPS 1492", 
    "CLPS 1520", "CLPS 1950", "DATA 1030", "DATA 1340", "DATA 1080", "DEVL 1810", "EEPS 1340", 
    "EEPS 1720", "ECON 1490", "ECON 1870", "EDUC 1485", "ENGN 1010", "ENGN 1550", "ENGN 1570", 
    "ENGN 1580", "ENGN 1590", "ENGN 1600", "ENGN 1610", "ENGN 1630", "ENGN 1640", "ENGN 1650", 
    "ENGN 1660", "ENGN 1800", "ENGN 1931J", "ENGN 1931T", "ENGN 2520", "IAPA 1701A", "IAPA 1801", 
    "IAPA 1801I", "IAPA 1811", "MUSC 1210", "NEUR 1440", "NEUR 1660", "PHIL 1630", "PHIL 1635", 
    "PHIL 1675", "PHIL 1835", "PHIL 1855", "PHIL 1880", "PHYS 1590", "PHYS 1600", "PHYS 2550", 
    "PHP 1855", "PHP 1689", "PLCY 1702X", "ARTS 1550"]

  cases (List) all-1000:
    | empty => empty
    | link(f, r) =>
      ask:
        | ((get-dept(f) == "APMA") and ((get-num(f) == some(1655)) or (get-num(f) == some(1650))))
          and (num-used < 3) then:
          if used-apma-165x:
            use-non-cs-1000(r, num-used, used-apma-165x)
          else:
            link(f, use-non-cs-1000(r, num-used + 1, true))
          end
        | eligible-courses.member(f) and (num-used < 3) then:
          link(f, use-non-cs-1000(r, num-used + 1, used-apma-165x))
        | otherwise:
          use-non-cs-1000(r, num-used, used-apma-165x)
      end
  end
end

check "use-non-cs-1000":
  eligible-courses = [list: "APMA 1080", "APMA 1160", "APMA 1690", "APMA 1170", "APMA 1200", 
    "APMA 1210", "APMA 1360", "APMA 1650", "APMA 1655", "APMA 1660", "APMA 1670", "APMA 1710", 
    "APMA 1720", "APMA 1740", "APMA 1910", "APMA 1930W", "APMA 1930X", "APMA 2822B", "PHP 2630",
    "PHP 2650", "CLPS 1211", "CLPS 1291", "CLPS 1342", "CLPS 1350", "CLPS 1491", "CLPS 1492", 
    "CLPS 1520", "CLPS 1950", "DATA 1030", "DATA 1340", "DATA 1080", "DEVL 1810", "EEPS 1340", 
    "EEPS 1720", "ECON 1490", "ECON 1870", "EDUC 1485", "ENGN 1010", "ENGN 1550", "ENGN 1570", 
    "ENGN 1580", "ENGN 1590", "ENGN 1600", "ENGN 1610", "ENGN 1630", "ENGN 1640", "ENGN 1650", 
    "ENGN 1660", "ENGN 1800", "ENGN 1931J", "ENGN 1931T", "ENGN 2520", "IAPA 1701A", "IAPA 1801", 
    "IAPA 1801I", "IAPA 1811", "MUSC 1210", "NEUR 1440", "NEUR 1660", "PHIL 1630", "PHIL 1635", 
    "PHIL 1675", "PHIL 1835", "PHIL 1855", "PHIL 1880", "PHYS 1590", "PHYS 1600", "PHYS 2550", 
    "PHP 1855", "PHP 1689", "PLCY 1702X", "ARTS 1550"]

  use-non-cs-1000(eligible-courses, 3, false) is empty
  use-non-cs-1000(eligible-courses, 1, false) is [list: "APMA 1080", "APMA 1160"]
  use-non-cs-1000([list: "APMA 1650", "CLPS 1342"], 2, true) is [list: "CLPS 1342"]
end

fun non-cs-at-least(course :: String, level :: Number) -> Boolean:
  doc: "determines if a course is not in cs and is a greater than or equal to level"
  has-name = not(get-dept(course) == "CSCI")
  cases (Option) get-num(course):
    | none => false
    | some(v) => has-name and (v >= level) 
  end
end

check "non-cs-at-least":
  non-cs-at-least("MATH 0500", 500) is true
  non-cs-at-least("CSCI 0500", 500) is false
  non-cs-at-least("MATH 0499", 500) is false
  non-cs-at-least("CSCI 0499", 500) is false
end