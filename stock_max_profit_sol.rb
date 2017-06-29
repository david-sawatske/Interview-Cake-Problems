# The brute force approach would be to try every pair of times (treating the
# earlier time as the buy time and the later time as the sell time) and see which
# one is higher.

# But that will take O(n^2) time, since we have two nested loops—for every time,
# we're going through every other time. Also, it's not correct: we won't ever
# report a negative profit! Can we do better?

# Well, our outer for loop goes through all the times and prices, but our inner
# for loop goes through one fewer price each time. So our total number of steps
# is the sum n + (n - 1) + (n - 2) ... + 2 + 1n+(n−1)+(n−2)...+2+1, which is
# still O(n^2) time. The sum of integers is O(n^2) see site

def get_max_profit(prices)
  max_profit = 0

  prices.each_index do |i|
    for j in (i + 1)...prices.length
      current_profit = prices[j] - prices[i]

      if current_profit > max_profit
        max_profit = current_profit
      end
    end
  end

  max_profit
end

stock_prices_yesterday = [10, 7, 5, 8, 11, 9]
p get_max_profit(stock_prices_yesterday)

# Best Option #
# We’ll greedily walk through the array to track the max profit and lowest
# price so far.
#
# For every price, we check if:
# we can get a better profit by buying at min_price and selling at the current_price
# we have a new min_price

# We decided to return a negative profit if the price decreases all day and we
# can't make any money. We could have raised an exception instead, but returning
# the negative profit is cleaner, makes our function less opinionated, and
# ensures we don't lose information.

# O(n) time and O(1) space. We only loop through the array once.

def get_max_profit(stock_prices_yesterday)

    # make sure we have at least 2 prices
    if stock_prices_yesterday.length < 2
        raise IndexError, 'Getting a profit requires at least 2 prices'
    end

    # we'll greedily update min_price and max_profit, so we initialize
    # them to the first price and the first possible profit
    min_price = stock_prices_yesterday[0]
    max_profit = stock_prices_yesterday[1] - stock_prices_yesterday[0]

    stock_prices_yesterday.each_with_index do |current_price, index|

        # skip the first time, since we already used it
        # when we initialized min_price and max_profit
        if index == 0 then next end

        # see what our profit would be if we bought at the
        # min price and sold at the current price
        potential_profit = current_price - min_price

        # update max_profit if we can do better
        max_profit = [max_profit, potential_profit].max

        # update min_price so it's always
        # the lowest price we've seen so far
        min_price  = [min_price, current_price].min
    end

    return max_profit
end
