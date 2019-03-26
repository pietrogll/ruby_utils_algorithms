#Given a word and a string S, find all starting indices in S which are anagrams of word. For example, given that word is “ab”, and S is “abxaba”, return 0, 3, and 4.

word = 'ab'
str = 'abxaba'

# Brute force
def anagram_finder str, word
	str = str.split('')
	word = word.split('').sort
	indexes = []
	for i in 0..str.size-1
		if word.include? str[i]
			indexes.push(i) if word == str[i, word.size].sort
		end
	end
	indexes
end
p anagram_finder str, word

# Frequency hash

def w_hash_builder w
	h = {}
	for char in w
		h[char].nil? ? h[char] = 1 : h[char] += 1
	end
	h
end

def update_hash_counter hash_counter, char, i, w_hash
	if w_hash[char].nil?
		hash_counter.clear
		nil
	else
		hash_counter[i.to_s] = w_hash.clone
		anagram_indexes = []
		hash_counter.each do |k, val|
			if val[char].nil?
				hash_counter.delete[k.to_s]
			else
				val[char] -= 1
				val.delete(char) if val[char] == 0
			end
			if val.keys.size == 0
				anagram_indexes.push(k.to_i)
				hash_counter.delete(k.to_s)
			end  
		end
		anagram_indexes
	end
end

def freq_anagram_finder str, word
	str = str.split('')
	word = word.split('').sort
	indexes = []
	w_hash =  w_hash_builder word
	hash_counter = {}
	indexes = []
	for i in 0..str.size-1
		char = str[i]
		anagram_indexes = update_hash_counter(hash_counter, char, i, w_hash)
		indexes.concat(anagram_indexes) unless anagram_indexes.nil?
	end
	indexes
end

p "freq_anagram_finder: #{freq_anagram_finder str, word}"


# Same code refactored

class HashCounter

	def initialize word
		@w_hash = build_w_hash word
		@hash_counter = {}
		@anagram_indexes = []
	end

	def update char, char_index
		if @w_hash[char].nil?
			@hash_counter.clear
		else
			@hash_counter[char_index.to_s] = @w_hash.clone
			@hash_counter.each do |k, val|
				if val[char].nil?
					@hash_counter.delete[k.to_s]
				else
					val[char] -= 1
					val.delete(char) if val[char] == 0
				end
				if val.keys.size == 0
					@anagram_indexes.push(k.to_i)
					@hash_counter.delete(k.to_s)
				end  
			end
		end
	end

	def anagram_indexes
		@anagram_indexes
	end
	
	private 

	def build_w_hash w
		h = {}
		for char in w
			h[char].nil? ? h[char] = 1 : h[char] += 1
		end
		h
	end

end


def freq_anagram_finder str, word
	str = str.split('')
	word = word.split('').sort
	indexes = []
	w_hash =  w_hash_builder word
	hash_counter = HashCounter.new word
	for char_index in 0..str.size-1
		char = str[char_index]
		hash_counter.update char, char_index
	end
	hash_counter.anagram_indexes
end

p "freq_anagram_finder with class: #{freq_anagram_finder str, word}"
