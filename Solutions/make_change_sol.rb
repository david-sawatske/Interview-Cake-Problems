# use a bottom-up algorithm to build up a table ways_of_doing_n_cents such that
# ways_of_doing_n_cents[k] is how many ways we can get to k cents using our
# denominations. We start with the base case that there's one way to create the
# amount zero, and progressively add each of our denominations.
#
# The number of new ways we can make a higher_amount when we account for a new
# coin is simply ways_of_doing_n_cents[higher_amount - coin], where we know that
# value already includes combinations involving coin (because we went bottom-up,
# we know smaller values have already been calculated).

def make_change(amount, denominations)
  ways_of_doing_n_cents = [0] * (amount + 1)
  ways_of_doing_n_cents[0] = 1

  denominations.each do |coin|
    (coin..amount).each do |higher_amount|
      higher_amount_remainder = higher_amount - coin
      ways_of_doing_n_cents[higher_amount] += ways_of_doing_n_cents[higher_amount_remainder]
    end
  end

  return ways_of_doing_n_cents[amount]
end

amt1 = 4
den1 = [1,2,3]
amt2 = 5
den2 = [1,3,5]

p make_change(amt1, den1) #== 4
p make_change(amt2, den2) #== 3
