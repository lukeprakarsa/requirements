use context starter2024

include file("reqs-common.arr")
include file("check-reqs.arr")

### DO NOT EDIT ANYTHING ABOVE THIS LINE ###

# Do not refer to anything from check-reqs.arr (other than check-reqs itself).
# You may define helpers here and use them in check blocks.

check "example":
  check-reqs([list: ]) is all-necessary
end