# Using iteration, write a method #fibs which takes a number
# and returns an array containing that many numbers from the
# fibonacci sequence.

def fibs(num)
  array = []
  i = 0
  while i < num
    if i == 0 || i == 1
      array.push(i)
    else
      next_num = array[i - 1] + array[i - 2]
      array.push(next_num)
    end
    i += 1
  end
  array
end

p fibs(8)

# Now write another method #fibs_rec which solves the same 
# problem recursively.

# couldn't figure out how to do this without two functions by myself
array = []
def fibs_rec(num)
  if num < 2
    num
  else
    fibs_rec(num - 1) + fibs_rec(num - 2)
  end
end

def loop(num)
  array = []
  i = 0
  while i < num
    array.push(fibs_rec(i))
    i += 1
  end
  array
end
p loop(8)

# needed help to figure out how to get it all in one function below
# still a little confused how that gets it all into an array

def fibs_rec2(num)
  return [0] if num <= 1
  return [0, 1] if num == 2

  array = fibs_rec2(num - 1)
  array << array[-2] + array[-1]
  return array
end

p fibs_rec2(8)

