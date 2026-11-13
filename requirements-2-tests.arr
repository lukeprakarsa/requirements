use context essentials2021

include file("reqs-common.arr")

include file("requirements-2-code.arr")
include file("requirements-2-common.arr")

# DO NOT CHANGE ANYTHING ABOVE THIS LINE
#
# Write your examples and tests in here.
# These should not be tests of implementation-specific details (e.g., helper functions).

exact-completed-roster =
  [list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410",
    "CSCI 0300", "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004",
    "CSCI 0320", "MATH 0520", "CSCI 1970", "CSCI 1973"]

exact-completed-roster-cs19 =
  [list: "MATH 0100", "CSCI 0190", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410",
    "CSCI 0300", "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004",
    "CSCI 0320", "MATH 0520", "CSCI 1970", "CSCI 1973"]

exact-completed-roster-apma =
  [list: "MATH 0100", "CSCI 0190", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410",
    "CSCI 0300", "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004",
    "APMA 1650", "MATH 0520", "CSCI 1970", "CSCI 1973"]

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
  check-requirements([list: "CSCICSCI 0190"]) is malformed
  check-requirements([list: "CSCI XXXX"]) is malformed
  check-requirements([list: "CSCI 0190", "CSCIC 0190"]) is malformed
end

check "malformed: department is four uppercase letters, or three and a padding space":
  check-requirements([list: "Csci 0190"]) is malformed
  check-requirements([list: "C5CI 0190"]) is malformed
  check-requirements([list: "1234 0190"]) is malformed
  check-requirements([list: "CS#I 0190"]) is malformed
  check-requirements([list: "CS I 0190"]) is malformed
  check-requirements([list: "P HP 0060"]) is malformed
  check-requirements([list: " PHP 0060"]) is malformed
  check-requirements([list: "CS   0190"]) is malformed
  check-requirements([list: "C    0190"]) is malformed
  check-requirements([list: "     0190"]) is malformed
end

check "malformed: department and number are separated by exactly one space":
  check-requirements([list: "CSCI-0190"]) is malformed
  check-requirements([list: "CSCI_0190"]) is malformed
  check-requirements([list: "CSCI\t0190"]) is malformed
  check-requirements([list: "CSCI00190"]) is malformed
  check-requirements([list: "CSCI  0190"]) is malformed
  check-requirements([list: "PHP 00600"]) is malformed
end

check "malformed: course number is exactly four digits":
  check-requirements([list: "CSCI 1.50"]) is malformed
  check-requirements([list: "CSCI -190"]) is malformed
  check-requirements([list: "CSCI +190"]) is malformed
  check-requirements([list: "CSCI 1/20"]) is malformed
  check-requirements([list: "CSCI 1e10"]) is malformed
  check-requirements([list: "CSCI 019A"]) is malformed
  check-requirements([list: "CSCI 019"]) is malformed
  check-requirements([list: ""]) is malformed
end

check "malformed: one bad name makes the whole roster malformed":
  check-requirements([list: "HIST 0150", "CSCI 1.50"]) is malformed
  check-requirements(exact-completed-roster + [list: "CSCI-1000"]) is malformed
  check-requirements([list: " PHP 0060"] + exact-completed-roster) is malformed
end

check "well-formed: text after the four digits is ignored":
  check-requirements(exact-completed-roster + [list: "CSCI 0190hahaha"]) is completed
  check-requirements(exact-completed-roster + [list: "HIST 0150 extra"]) is completed
  check-requirements(exact-completed-roster + [list: "CSCI 2951-S"]) is completed
  check-requirements(exact-completed-roster + [list: "PHP  0060 lab"]) is completed
  check-requirements(exact-completed-roster + [list: "ECON 0110 "]) is completed
end

check "well-formed: three-letter department padded with one space":
  check-requirements(exact-completed-roster + [list: "PHP  2630"]) is completed
end

check "completed but malformed":
  check-requirements(drop-course(exact-completed-roster, "CSCI 1970") + [list: "csci 1970"])
    is malformed
  check-requirements(drop-course(exact-completed-roster, "CSCI 1970") + [list: "CSCCC 1970"])
    is malformed
  check-requirements(drop-course(exact-completed-roster, "MATH 0520") + [list: "MATH0520"])
    is malformed
  check-requirements(drop-course(exact-completed-roster, "MATH 0520") + [list: "MATH XXXX"])
    is malformed
  check-requirements(drop-course(exact-completed-roster, "MATH 0520") + [list: "MATH 520"])
    is malformed
  check-requirements(drop-course(exact-completed-roster, "MATH 0520") + [list: "MATHH 0520"])
    is malformed
end

check "completed but unnecessary (should return completed anyways)":
  redundant-cs-courses = 
    [list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", "CSCI 0500", "CSCI 0410", 
      "CSCI 0300", "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", "CSCI 1004", "CSCI 1005", 
      "CSCI 0320", "MATH 0520", "CSCI 1970", "CSCI 1973", "CSCI 0170"]
  check-requirements(redundant-cs-courses) is completed
  extra-non-cs-courses = [list: "MATH 0100", "CSCI 0150", "CSCI 0200", "MATH 1530", 
    "CSCI 0500", "CSCI 0410", "CSCI 0300", "CSCI 1000", "CSCI 1001", "CSCI 1002", "CSCI 1003", 
    "CSCI 1004", "CSCI 1005", "CSCI 0320", "MATH 0520", "CSCI 1970", "CSCI 1973", "MATH 0170"]
  check-requirements(extra-non-cs-courses) is completed
end

check "happy case for completed":
  check-requirements(exact-completed-roster) is completed
end

check "completed prereq combinations":
  check-requirements(drop-course(exact-completed-roster, "MATH 0100") + [list: "MATH 0170"])
    is completed
  check-requirements(drop-course(exact-completed-roster, "MATH 0100") + [list: "MATH 0190"])
    is completed
end

check "completed intro-math combinations":
  check-requirements(drop-course(exact-completed-roster, "MATH 1530") + [list: "CSCI 0220"])
    is completed
end

check "completed foundations combinations":
  check-requirements(drop-course(exact-completed-roster, "CSCI 0300") + [list: "CSCI 0330"])
    is completed
end

check "completed core-cs combinations":
  check-requirements(drop-course(exact-completed-roster, "CSCI 0150") + [list: "CSCI 0111"])
    is completed
  check-requirements(drop-course(exact-completed-roster, "CSCI 0150") + [list: "CSCI 0170"])
    is completed
  check-requirements(drop-course(exact-completed-roster, "CSCI 0150") + [list: "CSCI 0190"])
    is completed
  check-requirements(drop-course(drop-course(exact-completed-roster, "CSCI 0150")
      + [list: "CSCI 0190"], "CSCI 0200") + [list: "CSCI 3000"]) is completed
end

check "completed four-add combinations":
  check-requirements(drop-course(exact-completed-roster, "MATH 0520") + [list: "MATH 0540"])
    is completed
  check-requirements(drop-course(exact-completed-roster, "MATH 0520") + [list: "APMA 0260"])
    is completed
  check-requirements(drop-course(exact-completed-roster, "CSCI 1973") + [list: "CSCI 1005"])
    is completed
  check-requirements(drop-course(exact-completed-roster, "CSCI 1970") + [list: "CSCI 1005"])
    is completed
end

check "order doesn't matter":
  check-requirements(exact-completed-roster.reverse()) is completed
end

check "complete with redundant prereqs":
  check-requirements(exact-completed-roster + [list: "MATH 0170"]) is completed
end

check "complete with redundant intro-cs":
  check-requirements(exact-completed-roster + [list: "CSCI 0190"]) is completed
end

check "has-unnecessary but malformed":
  check-requirements(exact-completed-roster + [list: "CSC00170"]) is malformed
end

check "double counts":
  check-requirements(drop-course(exact-completed-roster-cs19, "CSCI 0200") + [list: "CSCI 0330"]) 
    is has-unnecessary
end

check "missing 1000-level class, no double counting":
  check-requirements(drop-course(exact-completed-roster, "CSCI 1002")) is all-necessary
end

check "redundant linear algebras":
  check-requirements(drop-course(exact-completed-roster, "CSCI 0320") + [list: "MATH 0540"]) 
    is has-unnecessary
end

check "redundant ampa 16xx":
  check-requirements(drop-course(exact-completed-roster-apma, "MATH 0520") + [list: "APMA 1655"])
    is has-unnecessary
end

check "completed with non-cs":
  check-requirements(exact-completed-roster-non-cs) is completed
end

check "overuse non-cs":
  check-requirements(drop-course(exact-completed-roster-non-cs, "CSCI 0320") + [list: "APMA 1170"]) 
    is has-unnecessary
end

check "completed with non-technical cs":
  check-requirements(exact-completed-roster-non-tech) is completed
end

check "overuse non-technical cs":
  check-requirements(drop-course(exact-completed-roster-non-tech, "CSCI 0320")
      + [list: "CSCI 1370"]) is has-unnecessary
end

check "all-necessary but malformed":
  check-requirements(missing-prereq-malformed) is malformed
  check-requirements(missing-core-abd-malformed) is malformed
  check-requirements(missing-core-c-malformed) is malformed
  check-requirements(missing-intro-math-malformed) is malformed
  check-requirements(missing-foundations-a-malformed) is malformed
  check-requirements(missing-foundations-b-malformed) is malformed
  check-requirements(missing-foundations-c-malformed) is malformed
  check-requirements(missing-tech-elect-malformed) is malformed
  check-requirements(missing-four-add-malformed) is malformed
end

check "happy case for all-necessary":
  check-requirements(empty) is all-necessary
  check-requirements([list: "CSCI 0150"]) is all-necessary
  check-requirements([list: "CSCI 0190", "CSCI 0200"]) is all-necessary
  check-requirements([list: "MATH 0100"]) is all-necessary
  check-requirements(missing-prereq) is all-necessary
  check-requirements(missing-core-abd) is all-necessary
  check-requirements(missing-core-c) is all-necessary
  check-requirements(missing-intro-math) is all-necessary
  check-requirements(missing-foundations-a) is all-necessary
  check-requirements(missing-foundations-b) is all-necessary
  check-requirements(missing-foundations-c) is all-necessary
  check-requirements(missing-tech-elect) is all-necessary
  check-requirements(missing-four-add) is all-necessary
end

check "all-necessary: courses outside the concentration are ignored":
  check-requirements([list: "HIST 0150"]) is all-necessary
  check-requirements([list: "PHP  0060", "MATH 0090", "APMA 1920"]) is all-necessary
  check-requirements([list: "CSCI 0100", "CSCI 0190", "CSCI 0200"]) is all-necessary
  check-requirements(missing-tech-elect + [list: "ENGL 0100"]) is all-necessary
end

check "has-unnecessary: an extra concentration course is still flagged among ignored ones":
  check-requirements([list: "HIST 0150", "CSCI 0150", "CSCI 0170", "CSCI 0200"])
    is has-unnecessary
end

check "approved outside courses: a padded three-letter department counts":
  check-requirements(drop-course(exact-completed-roster-non-cs, "APMA 1690") + [list: "PHP  2630"])
    is completed
  check-requirements(drop-course(exact-completed-roster-non-cs, "CSCI 0320") + [list: "PHP  2630"])
    is has-unnecessary
end

check "suffixes: a suffixed name counts as the course its first nine characters name":
  check-requirements([list: "CSCI 0150", "CSCI 0170hahaha", "CSCI 0200"]) is has-unnecessary
  check-requirements(drop-course(exact-completed-roster, "CSCI 0500") + [list: "CSCI 0500A"])
    is completed
end

check "suffixes: an approved outside course counts under any suffix":
  check-requirements(drop-course(exact-completed-roster-non-cs, "APMA 1690")
      + [list: "ENGN 1931C"]) is completed
  check-requirements(drop-course(exact-completed-roster-non-cs, "APMA 1690")
      + [list: "APMA 1930W"]) is completed
end

check "suffixes: a suffixed non-technical CSCI course counts as technical":
  check-requirements(drop-course(exact-completed-roster-non-tech, "CSCI 1004")
      + [list: "CSCI 1952B"]) is completed
end

check "approved outside courses: any 1000-level MATH course counts, up to the cap of three":
  check-requirements(drop-course(exact-completed-roster-non-cs, "APMA 1690") + [list: "MATH 1010"])
    is completed
  check-requirements(drop-course(exact-completed-roster-non-cs, "CSCI 0320") + [list: "MATH 1010"])
    is has-unnecessary
  check-requirements([list: "MATH 2010"]) is all-necessary
end

check "approved outside courses: MATH 1530 is one when CSCI 0220 is the math foundation":
  check-requirements(drop-course(exact-completed-roster-non-cs, "APMA 1690") + [list: "CSCI 0220"])
    is completed
  check-requirements(drop-course(exact-completed-roster-non-cs, "CSCI 0320") + [list: "CSCI 0220"])
    is has-unnecessary
end
