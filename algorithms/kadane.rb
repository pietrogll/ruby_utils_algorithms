#Given an array arr of N integers. Find the contiguous sub-array with maximum sum.

def kadane arr
	sum = 0
	max_sum = 0
	temp_ininital_index = 0
	ininital_index = 0
	final_index = 0
	arr.each_index do |i|
		num = arr[i]
		sum += num
		if sum > max_sum
			max_sum = sum 
			final_index = i
			ininital_index = temp_ininital_index
		end
		if sum < 0	
			sum = 0
			temp_ininital_index = i+1
		end
	end
	arr[ininital_index, final_index-ininital_index+1]
end

p kadane [1,2,3]
p kadane [1,2,3]
p kadane [1,-4,-1,4,2,3,-5,9]