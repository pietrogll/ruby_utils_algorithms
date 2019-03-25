#Recursive strategy
def fib(n)
	return 1 if (n === 0 || n===1)
	fib(n-1) + fib(n-2)
end
puts fib(5)

#Recursive with memoize
def fib_mem(n, mem=[])
	mem[0] ||= 1
	mem[1] ||= 1
	return mem[n] unless mem[n].nil?
	result = fib_mem(n-1, mem) + fib_mem(n-2, mem)
	mem[n] = result
	result
end
puts fib_mem(5)

#Bottom up strategy
def fib_bottom_up(n)
	return 1 if (n==0 || n==1)
	result = [1,1]
	for i in 2..n do
		result[i] = result[i-1]+result[i-2]	
	end
	result.last
end
puts fib_bottom_up(5)