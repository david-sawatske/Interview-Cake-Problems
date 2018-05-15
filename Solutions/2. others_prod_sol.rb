# We’re redoing multiplications when instead we could be storing the results!
# This would be a great time to use a greedy approach.

# O(n) time and O(n) space. We make two passes through our input an array,
# and the array we build always has the same length as the input array.


def others_prod(arr)
  if arr.length < 2
    raise IndexError, 'Getting the product of numbers at other indices requires at least 2 numbers'
  end

  products_of_all_ints_except_at_index = []

  # for each integer, we find the product of all the integers
  # before it, storing the total product so far each time
  product_so_far = 1
  i = 0
  while i < arr.length
    products_of_all_ints_except_at_index[i] = product_so_far
    product_so_far *= arr[i]
    i += 1
  end

  # for each integer, we find the product of all the integers
  # after it. since each index in products already has the
  # product of all the integers before it, now we're storing
  # the total product of all other integers
  product_so_far = 1
  i = arr.length - 1
  while i >= 0
    products_of_all_ints_except_at_index[i] *= product_so_far
    product_so_far *= arr[i]
    i -= 1
  end

  return products_of_all_ints_except_at_index
end

arr1 =  [1, 7, 3, 4]
arr2 =  [3, 1, 2, 5, 6, 4]

p others_prod(arr1) ==  [84, 12, 28, 21]
p others_prod(arr2) == [240, 720, 360, 144, 120, 180]


# shorter syntax
def others_prod(arr)
	prods = []
	hold = 1

	arr.each_index do |i|
		prods[i] = hold

		hold *= arr[i]
	end

	hold = 1
	for i in (arr.length - 1).downto(0) do
		prods[i] *= hold

		hold *= arr[i]
	end

	prods
end
