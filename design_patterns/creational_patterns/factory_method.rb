#FUENTES: 
#https://www.tutorialspoint.com/design_pattern/index.htm
#https://sourcemaking.com/design_patterns
#https://refactoring.guru/

#CREATIONAL PATTERN
#These design patterns provides way to create objects while hiding the creation logic, rather than instantiating objects directly using new operator. This gives program more flexibility in deciding which objects need to be created for a given use case.

#FACTORY METHOD 
#The Factory Method pattern suggests that you replace direct object construction calls (using the new operator) with calls to a special factory method. Don’t worry: the objects are still created via the new operator, but it’s being called from within the factory method.

class ShapeFactory

	class << self

		def factor_shape shape_type
			shape_class = get_shape_class_for(shape_type.to_sym)
			generate_shape_for(shape_class)
		end

		private

		def shapes_catalog
			{
				circle: Circle,
				square: Square,
				rectangle: Rectangle
			}
		end

		def get_shape_class_for shape
			shapes_catalog.fetch(shape)
		end

		def generate_shape_for shape_class
			shape_class.new
		end

	end
	
end

class Shape
	def print_family
		puts 'I am a shape'
	end
end

class Circle < Shape
	def print_product
		puts 'I am a circle'
	end
end

class Square < Shape
	def print_product
		puts 'I am a square'
	end
end

class Rectangle < Shape
	def print_product
		puts 'I am a rectangle'
	end
end

#DEMO 

shape = ShapeFactory.factor_shape('circle')
shape.print_family
# --> I am a shape
shape.print_product
# --> I am a circle
