# Given an array of integers, find the highest product you can get from three of
# the integers.

# Time
# Space

def highest_product_of_3(array_of_ints)
  high = [array_of_ints[0], array_of_ints[1]].max
  low  = [array_of_ints[0], array_of_ints[1]].min

  high2 = array_of_ints[0] * array_of_ints[1]
  low2  = array_of_ints[0] * array_of_ints[1]

  high3 = array_of_ints[0..2].reduce(:*)

  for i in 2...array_of_ints.length
    curr = array_of_ints[i]

    high3 = [
      high3,
      low2 * curr,
      high2 * curr
    ].max

    high2 = [
      high2,
      high * curr,
      low * curr
    ].max

    low2 = [
      low2,
      high * curr,
      low * curr
    ].min

    high = [high, curr].max
    low = [low, curr].min
  end

  high3
end

arr1 =  [-10, -10, 1, 3, 2]
arr2 =  [1, 10, -5, 1, -100]

p highest_product_of_3(arr1) == 300
p highest_product_of_3(arr2) == 5000
