# 1: Boolean Assertions
#Write a minitest assertion that will fail if the value.odd? is not true.
assert(value.odd?, 'the value is not odd')


# 2: Equality Assertions
# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.
assert_equal('xyz', value.downcase)

# 3: Nil Assertions
# Write a minitest assertion that will fail if value is not nil.
assert_nil(value)

# 4: Empty Object Assertions
# Write a minitest assertion that will fail if the Array list is not empty.
assert_empty(list)

# 5: Included Object Assertions
# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.
assert_includes(list, 'xyz')

# 6: Exception Assertions
# Write a minitest assertion that will fail unless employee.hire raises a
# NoExperienceError exception.
assert_raises(NoExperienceError) {employee.hire}

# 7: Type Assertions
# Write a minitest assertion that will fail if value is not an instance of the
# Numeric class exactly. value may not be an instance of one of Numeric's superclasses.
assert_instance_of(Numeric, value)

# 8: Kind Assertions
# Write a minitest assertion that will fail if the class of value is not Numeric
# or one of Numeric's subclasses (e.g., Integer, Float, etc).
assert_kind_of(Numeric, value)

# 9: Same Object Assertions
# Write a test that will fail if list and the return value of list.process are
# different objects.
assert_same(list, list.process)

# 10: Refutations
# Write a test that will fail if 'xyz' is one of the elements in the Array list:
refute_includes(list, 'xyz')


