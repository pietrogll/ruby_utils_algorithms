# You are given an array A containing 2*N+2 positive numbers, out of which 2*N numbers exist in pairs whereas the other two number occur exactly once and are distinct. You need to find the other two numbers and print them in ascending order.

require 'set'

def find_numbers arr
	set = Set.new
	arr.each { |num|
		if set.include? num
			set.delete num
		else
			set.add num
		end
	}
	set.to_a.sort
end

p find_numbers [1, 2, 3, 2, 1, 4]
p find_numbers [2, 1, 3, 2]