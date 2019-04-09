# Given a string S, find the longest palindromic substring in S. Substring of string S: S[ i . . . . j ] where 0 ≤ i ≤ j < len(S). Palindrome string: A string which reads the same backwards. More formally, S is palindrome if reverse(S) = S. Incase of conflict, return the substring which occurs first ( with the least starting index )

def best_of arr
	arr_of_lengths = arr.map{|el| el.size}
	best_pos =  arr_of_lengths.find_index(arr_of_lengths.max)
	p arr
	p arr[best_pos]
	arr[best_pos]
end

def find_lp s, i=0, j=s.size-1, il=0, jl=s.size-1
	return s[il, jl-il+1] if (i==j || j< i)

	if s[i] == s[j]
		return best_of [find_lp(s,i+1,j-1, il, jl), find_lp(s, i+1, j, i+1, jl), find_lp(s, i, j-1, il, j-1)]
	else
		best_of [find_lp(s, i+1, j, i+1, j), find_lp(s, i, j-1, i, j-1)]
	end

end

p "result: #{find_lp 'aaaabbaa'}"

# With dynamic programming

def find_lp_dp s, i=0, j=s.size-1, il=0, jl=s.size-1, mem = {}
	key=i.to_s+'_'+j.to_s
	return mem[key] unless mem[key].nil?
	if (i==j || j< i)
		mem[key] = s[il, jl-il+1] 
	elsif s[i] == s[j]
		mem[key] = best_of [find_lp_dp(s,i+1,j-1, il, jl, mem), find_lp_dp(s, i+1, j, i+1, jl, mem), find_lp_dp(s, i, j-1, il, j-1, mem)]
	else
		mem[key] = [find_lp_dp(s, i+1, j, i+1, j, mem), find_lp_dp(s, i, j-1, i, j-1, mem)]
	end
	return mem[key]

end


p "result_with_dp: #{find_lp_dp 'aaaabbaa'}"