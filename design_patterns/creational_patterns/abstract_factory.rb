#FUENTES: 
#https://www.tutorialspoint.com/design_pattern/index.htm
#https://sourcemaking.com/design_patterns
#https://refactoring.guru/

#CREATIONAL PATTERN
#These design patterns provides way to create objects while hiding the creation logic, rather than instantiating objects directly using new operator. This gives program more flexibility in deciding which objects need to be created for a given use case.

# ABSTRACT FACTORY 
# Abstract Factory is also called as factory of factories. It is responsible for creating a factory of related objects without explicitly specifying their classes. Each generated factory can give the objects as per the Factory pattern.

class FornitureFactoryProducer

	class << self
		
		def produce_factory style
			get_factory_for(style.to_sym)
		end

		private 

		def factories_catalog
			{
				classic: ClassicFornitureFactory,
				modern: ModernFornitureFactory
			}
		end

		def get_factory_for style
			factories_catalog.fetch(style)
		end

	end

end

class ClassicFornitureFactory

	class << self
		
		def factor_forniture forniture_type
			forniture_class = fornitures_catalog.fetch(forniture_type.to_sym)
			forniture_class.new
		end

		private

		def fornitures_catalog 
			{
				sofa: ClassicSofa,
				desk: ClassicDesk
			}
		end

	end

end

class ModernFornitureFactory

	class << self

		def factor_forniture forniture_type
			forniture_class = fornitures_catalog.fetch(forniture_type.to_sym)
			forniture_class.new
		end

		private

		def fornitures_catalog 
			{
				sofa: ModernSofa,
				desk: ModernDesk
			}
		end

	end

end

class ClassicSofa
	def print_product
		puts 'I am a classic sofa'
	end
end

class ClassicDesk
	def print_product
		puts 'I am a classic desk'
	end
end

class ModernSofa
	def print_product
		puts 'I am a modern sofa'
	end
end

class ModernDesk
	def print_product
		puts 'I am a mdoern desk'
	end
end

#DEMO 

forniture_factory = FornitureFactoryProducer.produce_factory('classic')
forniture = forniture_factory.factor_forniture('sofa')
forniture.print_product
# --> I am a classic sofa