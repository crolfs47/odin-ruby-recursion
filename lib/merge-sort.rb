# Build a method #merge_sort that takes in an array and returns
# a sorted array, using a recursive merge sort methodology.

# needed help to figure this one out

def merge_sort(unsorted_array)
  if unsorted_array.length < 2
    return unsorted_array
  else
    left_half = merge_sort(unsorted_array.slice(0, unsorted_array.length / 2))
    right_half = merge_sort(unsorted_array.slice(unsorted_array.length / 2, unsorted_array.length))
    merge(left_half, right_half)
  end
end

def merge(left_half, right_half)
  sorted_array = []
  while !left_half.empty? && !right_half.empty?
    if left_half[0] < right_half[0]
      sorted_array.push(left_half.shift)
    else
      sorted_array.push(right_half.shift)
    end
  end
  return sorted_array.concat(left_half).concat(right_half)
end

array = [5, 7, 3, 4, 1, 19, 2, 35, 1, 9, 6, 33, 45, 23]
p merge_sort(array)


# initial attempt below was a bit of a mess

def xmerge(arr1, arr2)
  new_array = []
  arr2.each_with_index do |item, index|
    if index >= arr2.length
      new_array.push(arr1)
    elsif index >= arr1.length
      new_array.push(arr2)  
    elsif arr1[index] > arr2[index]
      new_array.push(arr2[index], arr1[index])
    else
      new_array.push(arr2[index], arr1[index])
    end
  end
  new_array
end

def xmerge_sort(array)
  if array.length < 2
    return array
  else
    split_array_2 = array.slice(0, array.length/2)
    split_array_3 = array.slice(array.length/2, array.length)
    sorted_1 = merge_sort(split_array_2)
    sorted_2 = merge_sort(split_array_3)
    p "sorted 1 is #{sorted_1}"
    p "sorted 2 is #{sorted_2}"
    p "split array 2 is #{split_array_2}"
    p "split array 3 is #{split_array_3}"
    if sorted_1 == nil && sorted_2 == nil
      new_array = merge(split_array_2, split_array_3)
    elsif sorted_1 == nil && sorted_2 != nil
      new_array = merge(sorted_2, split_array_2)
    elsif sorted_1 != nil && sorted_2 == nil
      new_array = merge(sorted_1, split_array_3)
    else
      new_array = merge(sorted_1, sorted_2)
    end
    new_array
  end
end

