#Ugly numbers are numbers whose only prime factors are 2, 3 or 5. The sequence 1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15, … shows the first 11 ugly numbers. By convention, 1 is included. Write a program to find Nth Ugly Number.

require 'set'

def is_ugly? num, ugly_numbers = Set.new
	init_num = num
	num = num / 2 if num % 2 == 0
	num = num / 3 if num % 3 == 0
	num = num / 5 if num % 5 == 0
	return true if ugly_numbers.include?(num)
	return false if num == init_num
	is_ugly? num
end

def find_ugly_number_at_pos n
	ugly_numbers = Set.new([1])
	num = 2
	while ugly_numbers.size < n
		ugly_numbers.add(num) if is_ugly?(num, ugly_numbers)
		num += 1
	end
	num - 1
end

p find_ugly_number_at_pos 10
# # --> 12


p find_ugly_number_at_pos 4
# --> 4

p find_ugly_number_at_pos 101
# --> 1600