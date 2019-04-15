# Minimum cost to reach end of array array when a maximum jump of K index is allowed

# Given an array arr[] of N integers and an integer K, one can move from an index i to any other j if j ≤ i + k. The cost of moving from one index i to the other index j is abs(arr[i] – arr[j]). Initially we start from the index 0 and we need to reach the last index i.e. N – 1. The task is to reach the last index in the minimum cost possible.

def cost_of path, arr 
	return 0 if path.size == 1 
	return (arr[0]-arr[1]).abs if path.size == 2
	path_cost = 0
	for i in 1..path.size-1 do 
		path_cost += (arr[path[i]] - arr[path[i-1]]).abs if i-1 >=0
	end
	path_cost
end

def best_of paths, arr
	min_path_cost = nil
	best_path = paths.reduce([]) do |bp, path| 
		path_cost = cost_of(path, arr)
		if min_path_cost.nil? || path_cost < min_path_cost
			min_path_cost = path_cost
			bp = path
		end
		bp
	end
	best_path
end

def paths_to i, k, paths
	paths_to_i = []
	for j in 1..k do
		paths_to_i.push(paths[i-j].clone.push(i)) unless i-j < 0 
	end
	paths_to_i
end

def best_path arr, k
	paths = [[0]] 
	for i in 1..arr.size-1 do
		paths[i] = best_of(paths_to(i,k,paths.clone), arr)
	end
	paths[arr.size-1]
end

ARR = [10, 80, 40, 50, 30, 40, 50, 20]
K = 3
p "best_path: #{best_path(ARR, K)}"
p "cost: #{cost_of(best_path(ARR, K), ARR)}"

ARR_2 = [40, 10, 20, 70, 80, 10]
K_2 = 4
p "best_path_2: #{best_path(ARR_2, K_2)}"
p "cost_2: #{cost_of(best_path(ARR_2, K_2), ARR_2)}"
