#Given two arrays A1[] and A2[] of size N and M respectively. The task is to sort A1 in such a way that the relative order among the elements will be same as those in A2. For the elements not present in A2, append them at last in sorted order. It is also given that the number of elements in A2[] are smaller than or equal to number of elements in A1[] and A2[] has all distinct elements.

def binary_searcher arr, el, i=0, j=arr.size-1
	if i==j
		return i+1 if arr[i] < el
		return i 
	end
	mid_index = (i+j)/2
	mid_val = arr[mid_index]
	if mid_val <= el
		return mid_index +1 if arr[mid_index+1] >= el
		binary_searcher arr, el, mid_index+1, j
	else
		return mid_index if arr[mid_index-1] <= el
		binary_searcher arr, el, i, mid_index-1
	end

end

def insert_by_order el, arr
	return [el] if arr.size==0
	inserting_index = binary_searcher(arr, el)
	arr[0, inserting_index] + [el] + arr[inserting_index, arr.size-inserting_index]
end

def insert_by_a2 el, arr, i
	change_el_index = 0
	j = 0
	while j < arr.size && change_el_index < i
		change_el_index += 1 if(arr[j] != arr[j+1]) 
		j += 1
	end
	arr[0,j]+[el]+arr[j, arr.size-j]
end

def relative_sorter a1, a2
	h2 = {}
	a2.each_index{|i| h2[a2[i].to_s]=i}
	second_part_arr = []
	first_part_arr = []
	a1.each do |el|
		if h2[el.to_s].nil?
			second_part_arr = insert_by_order(el, second_part_arr)
		else
			first_part_arr = insert_by_a2(el, first_part_arr, h2[el.to_s])
		end
	end
	first_part_arr + second_part_arr
end

p relative_sorter [2, 1, 2, 5, 7, 1, 9, 3, 6, 8, 8], [2, 1, 8, 3]