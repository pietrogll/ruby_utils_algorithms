# Given an array arr[] of N integers, the task is to find the length of the longest sub-sequence such that adjacent elements of the sub-sequence have at least one digit in common.


def have_common_digit? n1, n2
  !(n1.to_s.split('') & n2.to_s.split('')).empty?
end

def find_longest arr

  sequences = []
  
  for i in 0..arr.size-1

    check = false
    sequences.each{ |sequence|
      seq_check = false
      j = sequence.size-1
      while seq_check == false and j >= 0
        if have_common_digit?(sequence[j], arr[i])
          if j == sequence.size-1
            sequence.push(arr[i]) 
          else
            new_seq = sequence[0, j+1]+[arr[i]]
            sequences.push(new_seq)
          end
          check = true
          seq_check = true
        end
        j-=1
      end
    }
    if !check
      sequences.push([arr[i]])
    end
  end

  p sequences
  longest_seq = sequences.reduce([]){ |longest_seq, seq|
    longest_seq = seq if longest_seq.size < seq.size
    longest_seq  
  }

end

arr = [1, 12, 44, 29, 33, 96, 89]
p "longest for #{arr} --> #{find_longest(arr)}"
# --> [1, 12, 29, 96, 89]

arr = [19, 29, 38, 89, 15]
p "longest for #{arr} --> #{find_longest(arr)}"
# sequences = []
# [[19]]
# [[19,29]]
# [[19,29], [38]
# [[38], [19,29,89], [19, 15]]
# --> [19,29,89]


arr = [19, 29, 38, 89, 15, 56, 64, 26, 63]
p "longest for #{arr} --> #{find_longest(arr)}"
# --> [19,15,56,64,26,63]
# sequences = []

# { 
#   '1': [19,15],
#   '9': [19,29,89],
#   '2': [29, 26],
#   '3': [38, 63],
#   '8': [38, 89],
#   '5': [15, 56],
#   '6': [56, 64, 26, 63]
#   '4': [64]
# }