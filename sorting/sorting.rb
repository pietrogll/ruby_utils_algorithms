#STABILITY OF A SORTING ALGORITM: A sortign algorithm is stable if mantains the relative position of two equal elements.

# MergeSort
#Time complexity: O(NlogN)
def merge_sort arr
  if arr.size > 1
    mid = arr.size / 2
    left = arr[0, mid]
    right = arr[mid, arr.size-mid]
    
    merge_sort(left)
    merge_sort(right)

    i,j,k = 0,0,0

    while (i < left.size and j < right.size) do
      if left[i] < right[j]
        arr[k] = left[i]
        i+=1
      else
        arr[k] = right[j]
        j+=1
      end
      k+=1
    end

    while i < left.size do
      arr[k] = left[i]
      i+=1
      k+=1
    end

    while j < right.size do
      arr[k] = right[j]
      j+=1
      k+=1
    end

  end
end
example = [23, 4, 38, 6, 0, 12]
merge_sort example
p "result merge_sort---> #{example}"


# QuickSort
#Time complexity: Best case scenario O(NlogN) / Worst case scenario O(N^2)
# Best for small arrays
# Not stable
def quick_sort arr, first, last
  return arr if last <= first
  pivot = arr[last]
  j = first

  for i in first..last-1 do
    if pivot > arr[i]
      arr[i], arr[j] = arr[j], arr[i]
      j+= 1
    end
  end
  arr[j], arr[last] = arr[last], arr[j]
  quick_sort(arr, first, j-1)
  quick_sort(arr, j+1, last)
end
example = [4, 1, 78, 23, 4, 38, 6, 0, 12]
p "result quick_sort---> #{quick_sort(example, 0, example.size-1)}"


# HeapSort
# Time complexity: O(NlogN)
# Not stable
def heap_sort arr, last_el_pos
  if last_el_pos > 0
     def order_heap father_index, arr, last_el_pos
        largest_i = father_index
        left_i = 2*father_index + 1
        right_i = 2*father_index + 2
        if (left_i <= last_el_pos && arr[largest_i] < arr[left_i])
          largest_i = left_i
        end
        if (right_i <= last_el_pos && arr[largest_i] < arr[right_i])   
          largest_i = right_i
        end
        if largest_i != father_index
          arr[largest_i], arr[father_index] = arr[father_index], arr[largest_i] 
        end
    end
    n = last_el_pos + 1
    last_father_index = n/2-1 #index of the father of the last element of the arry
      
    while last_father_index >= 0  do
      order_heap last_father_index, arr, last_el_pos
      last_father_index -= 1
    end
    arr[last_el_pos], arr[0] = arr[0], arr[last_el_pos]
    last_el_pos-=1    
    heap_sort(arr, last_el_pos)
  end
end
example = [1, 56, 7, 7, 12, 23, 4, 15, 6, 0, 9, 38]
heap_sort example, example.size-1 
p "result heap_sort---> #{example}"