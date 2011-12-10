# # Simple Module Demonstration
# class Human
#   extend Movement # Will make Movement methods available to class
# end
# 
# class Dog
#   include Movement # Will make Movement methods available to instance
# end
# 
# module Movement
#   def occupy
#     "occupying..."
#   end
#   
#   def walk
#     "walking..."
#   end
# end

# Very Simplest Implementation
# module Concerns::Autocompleteable  
#   # To be invoked in AR class via extend Concerns::Autocompleteable
#   def starts_with(name)
#     self.where("name LIKE :search", :search => "#{name}%")
#   end
# end

# More Complicated
# module Concerns::Autocompleteable
#   # To be invoked in AR class via extend Concerns::Autocompleteable
#   def starts_with(name)
#     self.where("name LIKE :search", :search => "#{name}%")
#   end
#   
#   # Should be invoked in AR class via include Concerns::Autocompleteable
#   def more_like(increment = 3)
#     starting_with = self.name[0..2]
#     self.class.starts_with(starting_with)
#   end
# end

# The Vanilla Ruby Idiom (and Anti Pattern)
# module Concerns::Autocompleteable
#   # To be used in AR class via include Concerns::Autocompleteable
#   
#   def self.included(base)
#     base.extend ClassMethods
#     base.send(:include, InstanceMethods)
#   end
#   
#   module ClassMethods
#     def starts_with(name)
#       self.where("name LIKE :search", :search => "#{name}%")
#     end
#   end
#   
#   module InstanceMethods
#     def more_like(increment = 3)
#       starting_with = self.name[0..2]
#       self.class.starts_with(starting_with)
#     end
#   end
# end

# The Rails 3 Pattern
module Concerns::Autocompleteable
  # To be used in AR class via include Concerns::Autocompleteable
  
  extend ActiveSupport::Concern
      
  module ClassMethods
    def starts_with(name)
      self.where("name LIKE :search", :search => "#{name}%")
    end
  end
  
  module InstanceMethods
    def more_like(increment = 3)
      starting_with = self.name[0..2]
      self.class.starts_with(starting_with)
    end
  end
end

# The acts_as plugin pattern
# module Concerns
#   module Autocompleteable
#   end
# end