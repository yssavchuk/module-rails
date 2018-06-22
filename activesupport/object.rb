require 'active_support/core_ext/object/inclusion'

# Object #presence_in
allowed_values = [1,2,3]
a = 1.presence_in(allowed_values) || 0 # Same as a.in?(allowed_values) ? a : 0
