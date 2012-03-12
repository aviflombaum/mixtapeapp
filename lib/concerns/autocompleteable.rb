# # Simple Module Demonstration
# class Person
#   extend Search # Will make Search methods available to class
# end
# 
# class Person
#   include Search # Will make Search methods available to instance
# end
# 
# module Search
#   def self.find
#     "looking for a person"
#   end
#   
#   def find
#     "a person looking for a thing"
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
# module Concerns::Autocompleteable
#   # To be used in AR class via include Concerns::Autocompleteable
#   
#   extend ActiveSupport::Concern
#       
#   module ClassMethods
#     def starts_with(name, column = :name) # add column, default options
#       self.where("#{column} LIKE :search", :search => "#{name}%")
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

# The acts_as plugin pattern
# The Rails acts_as Pattern
# module Autocompleteable
#   # To be used in AR class via acts_as_autocompleteable
#   extend ActiveSupport::Concern
#     
#   included do
#   end
#     
#   module ClassMethods  
#     def acts_as_autocomplete(options = {})
#       cattr_accessor :autocompleteable_column
#       self.autocompleteable_column = (options[:on] || :name).to_s
#     end
# 
#     def starts_with(query)
#       self.where("#{self.autocompleteable_column} LIKE :query", :query => "#{query}%")
#     end
#   end
# 
#   module InstanceMethods
#     def more_like(increment = 3)
#       starting_with = self.send(self.class.autocompleteable_column)[0..2]
#       self.class.starts_with(starting_with)
#     end
#   end
# end
# 
# ActiveRecord::Base.send :include, Autocompleteable