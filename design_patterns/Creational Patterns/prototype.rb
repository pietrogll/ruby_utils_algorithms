#FUENTES: 
#https://www.tutorialspoint.com/design_pattern/index.htm
#https://sourcemaking.com/design_patterns
#https://refactoring.guru/

#CREATIONAL PATTERN
#These design patterns provides way to create objects while hiding the creation logic, rather than instantiating objects directly using new operator. This gives program more flexibility in deciding which objects need to be created for a given use case.

# PROTOTYPE
# Prototype lets you copy existing objects without making your code dependent on their classes.

class PrototypapleObjectClass

	def initialize attributes
		@attributes = attributes
	end
	
	attr_reader :attributes

	def change_attributes
		@attributes = 'New attributes'
	end

	def make_clone
		PrototypapleObjectClass.new(
			self.attributes
		)
	end

end

#DEMO 

object = PrototypapleObjectClass.new('Initial attributes')
object_clone = object.make_clone
puts object_clone.attributes
# --> Initial attributes

object.change_attributes
object_clone_2 = object.make_clone
puts object_clone_2.attributes
# --> New attributes
puts object_clone.attributes
# --> Initial attributes