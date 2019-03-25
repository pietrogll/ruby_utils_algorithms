
SET = [1,2,3,4,9,10]
SUM = 16

#Backtracking recursive approach
def backtracking_calculator (subset=Subset.new())
	return 1 if subset.is_solution?
	return 0 if subset.is_complete?
	l = Subset.new(subset.subset + [0])
	r = Subset.new(subset.subset + [1])
	return backtracking_calculator(l) + backtracking_calculator(r) if r.is_valid?
	backtracking_calculator(l)
end
class Subset 
	
	def initialize arr=[]
		@subset = arr
	end

	attr_reader :subset

	def is_complete?
		subset.size == SET.size
	end

	def is_solution?
		sum_right?
 	end

	def sum_right?
		subset_sum == SUM
	end

	def is_valid?
		subset_sum <= SUM
	end

	def subset_sum
		s = 0
		subset.each_with_index{|el, i| s += SET[i] * el}
		s
	end

end
puts backtracking_calculator()

#Recursive approach
def calculator_mem(arr=SET, sum=SUM)
	return 1 if (sum == 0)
	return 0 if (sum <0 || (arr.size == 0 && sum > 0))
	complementary_sum = sum - arr.last
	popped_arr = arr.take(arr.size-1)
	calculator_mem(popped_arr, complementary_sum) +  calculator_mem(popped_arr, sum)
end
puts calculator_mem()