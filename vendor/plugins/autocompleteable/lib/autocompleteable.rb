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