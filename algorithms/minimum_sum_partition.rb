#Given an array, the task is to divide it into two sets S1 and S2 such that the absolute difference between their sums is minimum.

def exist_subset_summing? n, i=0, mem={}
	k = i.to_s+'_'+n.to_s
	mem[k] = true if @arr[i] == n
	mem[k] = false if i == @arr.size-1 || n < 0
	return mem[k] unless mem[k].nil?
	mem[k] = exist_subset_summing?(n-@arr[i], i+1, mem) || exist_subset_summing?(n, i+1, mem)
end

def min_abs_dif 
	total = @arr.sum
	middle = total / 2
	min_dif = nil
	i = 0
	while min_dif.nil?
		if (exist_subset_summing?(middle-i))
			min_dif = total-2*(middle-i)
		else
			i += 1
		end
	end
	min_dif
end

@arr = [1, 6, 5, 11]
p min_abs_dif 

@arr = [36, 7, 46, 40]
p min_abs_dif 

@arr = [20, 36, 7, 46, 40, 53]
p min_abs_dif 

