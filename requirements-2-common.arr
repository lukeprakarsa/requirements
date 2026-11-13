use context essentials2021

provide *
provide-types *

include file("reqs-common.arr")

# DO NOT CHANGE ANYTHING ABOVE THIS LINE
#
# Write data bindings here that you'll need for tests in both requirements-2-code.arr and
# requirements-2-tests.arr

fun drop-course(roster :: List<String>, target :: String) -> List<String>:
  doc: "removes target from roster"
  filter(lam(course): not(course == target) end, roster)
end

check "drop-course: removes only the target, and changes nothing if it's absent":
  drop-course([list: "CSCI 0150", "MATH 0100"], "CSCI 0150") is [list: "MATH 0100"]
  drop-course([list: "CSCI 0150", "MATH 0100"], "CSCI 0200") is [list: "CSCI 0150", "MATH 0100"]
  drop-course(empty, "CSCI 0150") is empty
end
