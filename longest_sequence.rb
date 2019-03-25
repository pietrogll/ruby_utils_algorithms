#Given an array of numbers, find the length of the longest increasing subsequence in the array. The subsequence does not necessarily have to be contiguous. For example, given the array [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15], the longest increasing subsequence has length 6: it is 0, 2, 6, 9, 11, 15.

#Dynamic programming / O(n^2)

def calculate_longest_length_for arr, final_index, length, indexes
	for j in 0..final_index
		if arr[j] < arr[final_index] and length[final_index] < length[j]+1
			length[final_index] = length[j] + 1
			indexes[final_index] = j
		end 
	end
end

def extract_sequence_from indexes, arr, max_i
	sequence = [arr[max_i]]
	i = max_i
	while i > 0
		sequence.push(arr[indexes[i]])
		i = indexes[i]
	end
	sequence
end

def longest_subsequence_length arr
	length = []
	indexes = []
	indexes[0] = 0
	max = 1
	max_i = 0
	for i in 0..arr.size-1
		length[i] = 1
		calculate_longest_length_for arr, i, length, indexes
		if max < length[i]
			max = length[i] 
			max_i = i
		end
	end
	sequence = extract_sequence_from indexes, arr, max_i
	return [max, sequence]
end

example = [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15, 14, 18]
p longest_subsequence_length(example)


# Other approach O(nlogn)
 
def binary_search store, i=0, j=store.size, el
	mid = (i+j) / 2
	if store[mid].last >= el and store[mid-1].last<=el
		return mid-1
	elsif store[mid].last > el
		binary_search store, i, mid, el
	else
		binary_search store, mid, j, el
	end
end

def ls arr
	store = []
	store[0] = [arr[0]]
	max_length = 1
	arr.each do |el|
		store[0] = [el] if el < store[0].last
		if el > (store.last).last
			p "el: #{el}"
			p "---> #{store[0, store.length].last}"
			store[store.length] = (store.last.clone).push(el)
			p "store: #{store}"
		elsif el < (store.last).last
			store_index = binary_search(store, el)
			p "store_index: #{store_index}"
			store = store[0, store_index + 1] + store[store_index + 1].clone.push(el) + store[store_index+1, store.size]
			p "store: #{store}"
		end 
	end
	p store
end

example = [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15, 14, 18]
ls(example)