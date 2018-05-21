require 'active_support'
require 'active_support/core_ext'

# Wraps the current string in the ActiveSupport::StringInquirer class, which
# gives you a prettier way to test for equality.

env = 'production'.inquiry
env.production?  # => true
env.development? # => false