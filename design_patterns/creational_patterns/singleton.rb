#FUENTES: 
#https://www.tutorialspoint.com/design_pattern/index.htm
#https://sourcemaking.com/design_patterns
#https://refactoring.guru/

#CREATIONAL PATTERN
#These design patterns provides way to create objects while hiding the creation logic, rather than instantiating objects directly using new operator. This gives program more flexibility in deciding which objects need to be created for a given use case.

# SINGLETON
# Singleton is a creational design pattern that lets you ensure that a class has only one instance, while providing a global access point to this instance.

class SingletonObject

	def self.get_instance
		@instance
	end

	private

	class SingletonClass
		def declare_yourself
			puts 'I am the instance of the singleton'
		end
	end

	@instance = SingletonClass.new

end

#DEMO 

single_instance = SingletonObject.get_instance
single_instance.declare_yourself
#--> I am the instance of the singleton

single_instance.define_singleton_method(:new_method) do
  puts 'New method running'
end

same_single_instance = SingletonObject.get_instance
same_of_single_instance.new_method
#--> New method running