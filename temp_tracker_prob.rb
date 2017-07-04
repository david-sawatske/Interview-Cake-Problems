# Write a class TempTracker with these methods:
#
# insert()—records a new temperature
# getMax()—returns the highest temp we've seen so far
# getMin()—returns the lowest temp we've seen so far
# getMean()—returns the mean of all temps we've seen so far
# getMode()—returns a mode of all temps we've seen so far

class TempTracker

end

temps1 = TempTracker.new
[37, 86, 16, 33, 74, 18, 20, 83, 33, 43].each { |n| temps1.insert(n) }

p temps1.get_min == 16
p temps1.get_max == 86
p temps1.get_mean == 44.3
p temps1.get_mode == 33
