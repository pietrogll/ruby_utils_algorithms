# Given an array arr[] of N integers, the task is to select an integer x (which may or may not be present in the array) and remove all of its occurrences from the array and divide the remaining array into two non-empty sub-sets such that:

#    The elements of the first set are strictly smaller than x.
#    The elements of the second set are strictly greater than x.
#    The sum of the elements of both the sets is equal.

#If such an integer exists then print Yes otherwise print No.

def divider sorted_arr, i=0, j=sorted_arr.size-1, left_sum = 0, right_sum = 0

	
	return 'No' if j<=i
	
	right_sum += sorted_arr[j]

	while left_sum < right_sum
		left_sum += sorted_arr[i]
		i +=1
	end
	if left_sum == right_sum
		return 'Yes' if( sorted_arr[i] == sorted_arr[j-1] || (i == j && sorted_arr[i-1]+1<sorted_arr[j]))  	
	end

	divider(sorted_arr, i, j-1, left_sum, right_sum)

end

p divider [2,1,2,3,3,5].sort
# --> Yes

p divider [2,1,2,2,2,4,5].sort
# --> Yes

p divider [2,1,2,2,4,5].sort
# --> No

p divider [1,1,1,2,2,2,2,4,5,6]
# --> Yes
