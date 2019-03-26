#FUENTES: 
#https://www.tutorialspoint.com/design_pattern/index.htm
#https://sourcemaking.com/design_patterns
#https://refactoring.guru/

#CREATIONAL PATTERN
#These design patterns provides way to create objects while hiding the creation logic, rather than instantiating objects directly using new operator. This gives program more flexibility in deciding which objects need to be created for a given use case.

# BUILDER
# Builder pattern builds a complex object using simple objects and using a step by step approach.


class MealBuilder

	class << self

	def prepare_veggy_meal
		meal = Meal.new
		meal.add(Chips.new)
		meal.add(Coke.new)	
		meal
	end

	def prepare_classic_meal
		meal = Meal.new
		meal.add(Burger.new)
		meal.add(Fanta.new)
		meal
	end
	
	end
	
end


class Meal

	def initialize
		@meal = []
	end

	def add item
		@meal.push(item)
	end

	def total_price
		puts @meal.reduce(0){ |tot_price, item| tot_price + item.price }
	end

	def list_items
		puts @meal.reduce(''){ |list, item| list + item.name + ' ' }
	end

end

class Food
	def price
		4
	end
end


class Burger < Food
	def name
		'Burger'
	end
end



class Chips < Food
	def name
		'Chips'
	end
end

class Drink
	def price
		2
	end
end

class Coke < Drink
	def name
		'Coke'
	end
end

class Fanta	< Drink
	def name
		'Fanta'
	end
end



#DEMO 

meal = MealBuilder.new
classic_meal = MealBuilder.prepare_classic_meal
classic_meal.total_price
# --> 6
classic_meal.list_items
# --> Burger Fanta