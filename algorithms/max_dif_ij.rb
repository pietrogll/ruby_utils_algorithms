#Given an array arr[] of N positive integers. The task is to find the maximum of j - i subjected to the constraint of A[i] <= A[j].

def find_max_dif arr, i=0, j=arr.size-1
	return j - i if arr[i] <= arr[j]
	return [find_max_dif(arr,i+1,j), find_max_dif(arr,i,j-1)].max
end

p find_max_dif [34, 8, 10, 3, 2, 80, 30, 33, 1]
p find_max_dif [5, 8, 6, 8, 10, 1, 4, 7, 3, 4, 2, 3, 4, 2]