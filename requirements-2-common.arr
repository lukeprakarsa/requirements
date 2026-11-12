use context essentials2021

provide *
provide-types *

include file("reqs-common.arr")

# DO NOT CHANGE ANYTHING ABOVE THIS LINE
#
# Write data bindings here that you'll need for tests in both requirements-2-code.arr and requirements-2-tests.arr

data Completion:
  | completed        # requirements met, can graduate
  | all-necessary    # making progress, no unnecessary courses
  | has-unnecessary  # making progress, has unnecessary courses
  | malformed        # input is malformed
end