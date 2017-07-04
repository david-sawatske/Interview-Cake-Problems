# Write a class TempTracker with these methods:
#
# insert()—records a new temperature
# getMax()—returns the highest temp we've seen so far
# getMin()—returns the lowest temp we've seen so far
# getMean()—returns the mean of all temps we've seen so far
# getMode()—returns a mode of all temps we've seen so far

class TempTracker
  def initialize
    # for mode
    @occurrences = [0] * 111 # array of 0s at indices 0..110
    @max_occurrences = 0
    @mode = nil

    # for mean
    @total_numbers = 0
    @total_sum = 0.0 # mean should be float
    @mean = nil

    # for min and max
    @min_temp = nil
    @max_temp = nil
  end

  def insert(temperature)
    # for mode
    @occurrences[temperature] += 1
    if @occurrences[temperature] > @max_occurrences
      @mode = temperature
      @max_occurrences = @occurrences[temperature]
    end

    # for mean
    @total_numbers += 1
    @total_sum += temperature
    @mean = @total_sum / @total_numbers

    # for min and max
    @max_temp = temperature if @max_temp.nil? || temperature > @max_temp
    @min_temp = temperature if @min_temp.nil? || temperature < @min_temp
  end

  def get_max
    @max_temp
  end

  def get_min
    @min_temp
  end

  def get_mean
    @mean
  end

  def get_mode
    @mode
  end
end

temps1 = TempTracker.new
[37, 86, 16, 33, 74, 18, 20, 83, 33, 43].each { |n| temps1.insert(n) }

p temps1.get_min == 16
p temps1.get_max == 86
p temps1.get_mean == 44.3
p temps1.get_mode == 33
