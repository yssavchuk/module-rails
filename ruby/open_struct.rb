require 'ostruct'

measurements = OpenStruct.new("length (in inches)" => 24)
measurements.send("length (in inches)")   # => 24

message = OpenStruct.new(:queued? => true)
message.queued?                           # => true
message.send("queued?=", false)
message.queued?                           # => false

# Removing the presence of an attribute requires the execution of the
# #delete_field method as setting the property value to nil will not remove
# the attribute
first_pet  = OpenStruct.new(:name => "Rowdy", :owner => "John Smith")
second_pet = OpenStruct.new(:name => "Rowdy")

first_pet.owner = nil
first_pet                 # => #<OpenStruct name="Rowdy", owner=nil>
first_pet == second_pet   # => false

first_pet.delete_field(:owner)
first_pet                 # => #<OpenStruct name="Rowdy">
first_pet == second_pet   # => true

first_pet.same = nil
first_pet == second_pet   # => false
