use context starter2024

include file("reqs-common.arr")
include file("check-reqs.arr")

### DO NOT EDIT ANYTHING ABOVE THIS LINE ###

# Do not refer to anything from check-reqs.arr (other than check-reqs itself).
# You may define helpers here and use them in check blocks.


fun drop-course(roster :: List<String>, c :: String) -> List<String>:
  doc: "removes a target course from roster"
  filter(lam(course): not(course == c) end, roster)
end

exact-completed-roster =
  [list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410",
    "CSCI 0300", "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004",
    "CSCI 0320", "MATH 0520", "CSCI 1970", "CSCI 1970"]

exact-completed-roster-cs19 =
  [list: "MATH 0100", "CSCI 0190", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410",
    "CSCI 0300", "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004",
    "CSCI 0320", "MATH 0520", "CSCI 1970", "CSCI 1970"]

exact-completed-roster-apma =
  [list: "MATH 0100", "CSCI 0190", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410",
    "CSCI 0300", "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004",
    "APMA 1650", "MATH 0520", "CSCI 1970", "CSCI 1970"]

exact-completed-roster-non-cs =
  [list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410",
    "CSCI 0300", "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004",
    "CSCI 0320", "APMA 1080", "APMA 1160", "APMA 1690"]

exact-completed-roster-non-tech =
  [list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410",
    "CSCI 0300", "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004",
    "CSCI 0320", "CSCI 1250", "CSCI 1280", "CSCI 1360"]

missing-prereq = drop-course(exact-completed-roster, "MATH 0100")
missing-core-abd = drop-course(exact-completed-roster, "CSCI 0200")
missing-core-c = drop-course(exact-completed-roster, "CSCI 0200")
missing-intro-math = drop-course(exact-completed-roster, "MATH 1530")
missing-foundations-a = drop-course(exact-completed-roster, "CSCI 0500")
missing-foundations-b = drop-course(exact-completed-roster, "CSCI 0410")
missing-foundations-c = drop-course(exact-completed-roster, "CSCI 0300")
missing-tech-elect = drop-course(exact-completed-roster, "CSCI 1000")
missing-four-add = drop-course(exact-completed-roster, "CSCI 1970")

missing-prereq-malformed = missing-prereq + [list: "MATHMATH 0100"]
missing-core-abd-malformed = missing-core-abd + [list: "CSCICSCI 0200"]
missing-core-c-malformed = missing-core-c + [list: "CSCICSCI 0200"]
missing-intro-math-malformed = missing-intro-math + [list: "MATHMATH 1530"]
missing-foundations-a-malformed = missing-foundations-a + [list: "CSCICSCI 0500"]
missing-foundations-b-malformed = missing-foundations-b + [list: "CSCICSCI 0410"]
missing-foundations-c-malformed = missing-foundations-c + [list: "CSCICSCI 0300"]
missing-tech-elect-malformed = missing-tech-elect + [list: "CSCICSCI 1000"]
missing-four-add-malformed = missing-four-add + [list: "CSCICSCI 1970"]

check "malformed":
  check-reqs([list: "CSCICSCI 0190"]) is malformed
  check-reqs([list: "CSCI XXXX"]) is malformed
  check-reqs([list: "CSCI 0190", "CSCIC 0190"]) is malformed
end

check "completed but malformed":
  check-reqs(drop-course(exact-completed-roster, "CSCI 1970") + [list: "csci 1970"]) is malformed
  check-reqs(drop-course(exact-completed-roster, "CSCI 1970") + [list: "CSCCC 1970"]) is malformed
  check-reqs(drop-course(exact-completed-roster, "MATH 0520") + [list: "MATH0520"]) is malformed
  check-reqs(drop-course(exact-completed-roster, "MATH 0520") + [list: "MATH XXXX"]) is malformed
  check-reqs(drop-course(exact-completed-roster, "MATH 0520") + [list: "MATH 520"]) is malformed
  check-reqs(drop-course(exact-completed-roster, "MATH 0520") + [list: "MATHH 0520"]) is malformed
end

check "completed but unnecessary (should return completed anyways)":
  redundant-cs-courses = 
    [list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", 
      "CSCI 0300", "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 1005", 
      "CSCI 0320", "MATH 0520", "CSCI 1970", "CSCI 1970", "CSCI 0170"]
  check-reqs(redundant-cs-courses) is completed
  extra-non-cs-courses = [list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", 
    "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", 
    "CSCI 1004", "CSCI 1005", "CSCI 0320", "MATH 0520", "CSCI 1970", "CSCI 1970", "MATH 0170"]
  check-reqs(extra-non-cs-courses) is completed
end

check "happy case for completed":
  check-reqs(exact-completed-roster) is completed
end

check "completed prereq combinations":
  check-reqs(drop-course(exact-completed-roster, "MATH 0100") + [list: "MATH 0170"]) is completed
  check-reqs(drop-course(exact-completed-roster, "MATH 0100") + [list: "MATH 0190"]) is completed
end

check "completed intro-math combinations":
  check-reqs(drop-course(exact-completed-roster, "MATH 1530") + [list: "CSCI 0220"]) is completed
end

check "completed foundations combinations":
  check-reqs(drop-course(exact-completed-roster, "CSCI 0300") + [list: "CSCI 0330"]) is completed
end

check "completed core-cs combinations":
  check-reqs(drop-course(exact-completed-roster, "CSCI 0150") + [list: "CSCI 0111"]) is completed
  check-reqs(drop-course(exact-completed-roster, "CSCI 0150") + [list: "CSCI 0170"]) is completed
  check-reqs(drop-course(exact-completed-roster, "CSCI 0150") + [list: "CSCI 0190"]) is completed
  check-reqs(drop-course(drop-course(exact-completed-roster, "CSCI 0150") + [list: "CSCI 0190"], 
      "CSCI 0200") + [list: "CSCI 3000"]) is completed
end

check "completed four-add combinations":
  check-reqs(drop-course(exact-completed-roster, "MATH 0520") + [list: "MATH 0540"]) is completed
  check-reqs(drop-course(exact-completed-roster, "MATH 0520") + [list: "APMA 0260"]) is completed
  check-reqs(drop-course(exact-completed-roster, "CSCI 1970") + [list: "CSCI 1970", "CSCI 1973"]) 
    is completed
  check-reqs(drop-course(exact-completed-roster, "CSCI 1970") + [list: "CSCI 1973", "CSCI 1973"]) 
    is completed
end

check "order doesn't matter":
  check-reqs(exact-completed-roster.reverse()) is completed
end

check "complete with redundant prereqs":
  check-reqs(exact-completed-roster + [list: "MATH 0170"]) is completed
end

check "complete with redundant intro-cs":
  check-reqs(exact-completed-roster + [list: "CSCI 0190"]) is completed
end

check "has-unnecessary but malformed":
  check-reqs(exact-completed-roster + [list: "CSC00170"]) is malformed
end

check "double counts":
  check-reqs(drop-course(exact-completed-roster-cs19, "CSCI 0200") + [list: "CSCI 0330"]) 
    is has-unnecessary
end

check "missing 1000-level class, no double counting":
  check-reqs(drop-course(exact-completed-roster, "CSCI 1002")) is all-necessary
end

check "redundant linear algebras":
  check-reqs(drop-course(exact-completed-roster, "CSCI 0320") + [list: "MATH 0540"]) 
    is has-unnecessary
end

check "redundant ampa 16xx":
  check-reqs(drop-course(exact-completed-roster-apma, "MATH 0520") + [list: "APMA 1655"])
    is has-unnecessary
end

check "completed with non-cs":
  check-reqs(exact-completed-roster-non-cs) is completed
end

check "overuse non-cs":
  check-reqs(drop-course(exact-completed-roster-non-cs, "CSCI 0320") + [list: "APMA 1170"]) 
    is has-unnecessary
end

check "completed with non-technical cs":
  check-reqs(exact-completed-roster-non-tech) is completed
end

check "overuse non-technical cs":
  check-reqs(drop-course(exact-completed-roster-non-tech, "CSCI 0320") + [list: "CSCI 1370"])
    is has-unnecessary
end

check "all-necessary but malformed":
  check-reqs(missing-prereq-malformed) is malformed
  check-reqs(missing-core-abd-malformed) is malformed
  check-reqs(missing-core-c-malformed) is malformed
  check-reqs(missing-intro-math-malformed) is malformed
  check-reqs(missing-foundations-a-malformed) is malformed
  check-reqs(missing-foundations-b-malformed) is malformed
  check-reqs(missing-foundations-c-malformed) is malformed
  check-reqs(missing-tech-elect-malformed) is malformed
  check-reqs(missing-four-add-malformed) is malformed
end

check "happy case for all-necessary":
  check-reqs(empty) is all-necessary
  check-reqs([list: "CSCI 0150"]) is all-necessary
  check-reqs([list: "CSCI 0190", "CSCI 0200"]) is all-necessary
  check-reqs([list: "MATH 0100"]) is all-necessary
  check-reqs(missing-prereq) is all-necessary
  check-reqs(missing-core-abd) is all-necessary
  check-reqs(missing-core-c) is all-necessary
  check-reqs(missing-intro-math) is all-necessary
  check-reqs(missing-foundations-a) is all-necessary
  check-reqs(missing-foundations-b) is all-necessary
  check-reqs(missing-foundations-c) is all-necessary
  check-reqs(missing-tech-elect) is all-necessary
  check-reqs(missing-four-add) is all-necessary
end