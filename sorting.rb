# MergeSort
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
example = [23,4,38,6,0,12]
merge_sort example
p "result merge_sort---> #{example}"


# QuickSort
def quick_sort arr, first, last
  pivot = arr[last]
  j = first

  for i in first..last-1 do
    if pivot > arr[i]
      arr[i], arr[j] = arr[j], arr[i]
      j+= 1
    end
  end
  arr[j], arr[last] = arr[last], arr[j]
  quick_sort(arr, first, j-1) if first < j-1
  quick_sort(arr, j+1, last) if j+1 < last

end
example = [23,4,38,6,0,12]
quick_sort example, 0, example.size-1 
p "result quick_sort---> #{example}"


# HeapSort
def heap_sort arr, first

  max_index = arr.size/2 + 1
  j = 0
  for i in first..max_index
    if (!arr[2*i -1].nil? && arr[i-1] < arr[2*i-1])
      arr[i-1], arr[2*i-1] = arr[2*i-1], arr[i-1]
      j = 2*i-1
    end
    if (!arr[2*i].nil? && arr[i-1] < arr[2*i])   
      arr[i-1], arr[2*i] = arr[2*i], arr[i-1]
      j = 2*i
    end 
  end
  p j
  p arr
  arr[first-1], arr[j] = arr[j], arr[first-1] 
  heap_sort(arr, first+1) if first < max_index

end
example = [23,4,38,6,0,12]
heap_sort example, 1
p "result heap_sort---> #{example}"