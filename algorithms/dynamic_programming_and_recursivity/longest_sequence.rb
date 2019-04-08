#Given an array of numbers, find the length of the longest increasing subsequence in the array. The subsequence does not necessarily have to be contiguous. For example, given the array [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15], the longest increasing subsequence has length 6: it is 0, 2, 6, 9, 11, 15.

#Dynamic programming / O(n^2)

def calculate_longest_length_for arr, last_pos_of_arr, max_sequence_lengths, indexes
	for j in 0..last_pos_of_arr
		if arr[j] < arr[last_pos_of_arr] and max_sequence_lengths[last_pos_of_arr] < max_sequence_lengths[j]+1
			max_sequence_lengths[last_pos_of_arr] = max_sequence_lengths[j] + 1
			indexes[last_pos_of_arr] = j
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
	max_sequence_lengths = []
	indexes = []
	indexes[0] = 0
	max = 1
	max_i = 0
	for i in 0..arr.size-1
		max_sequence_lengths[i] = 1
		calculate_longest_length_for arr, i, max_sequence_lengths, indexes
		if max < max_sequence_lengths[i]
			max = max_sequence_lengths[i] 
			max_i = i
		end
	end
	sequence = extract_sequence_from indexes, arr, max_i
	return [max, sequence]
end

example = [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15, 14, 18]
p "The size and the subsequance are: #{longest_subsequence_length(example)}"


# Other approach O(nlogn)
 
def binary_search store, i=0, j=store.size, el
	mid = (i+j) / 2
	mid += 1 if mid == 0
	if store[mid].last >= el and store[mid-1].last<=el
		return mid
	elsif store[mid].last > el
		binary_search store, i, mid-1, el
	else
		binary_search store, mid, j, el
	end
end

def ls arr
	store = []
	store[0] = [arr[0]]
	max_length = 1
	arr.each do |el|
		if el < store[0].last
			store[0] = [el] 
		elsif el > (store.last).last
			store[store.length] = (store.last.clone).push(el)
		elsif el < (store.last).last
			inserting_index = binary_search(store, el)
			store[inserting_index] = store[inserting_index-1].clone.push(el)
		end 
	end
	p "================================================================="
	p "final store: #{store}"
	[store.size, store.last]
end

example = [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15, 14, 18]
p "The size and the subsequance are: #{ls(example)}"