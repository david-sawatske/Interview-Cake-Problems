# Write a function merge_ranges() that takes an array of meeting time ranges and
# returns an array of condensed ranges. The integers in the array represent the
# number of 30-minute blocks past 9:00am.

# Do not assume the meetings are in order. The meeting times are coming from
# multiple teams.

# Time
# Space

def merge_ranges(meetings)
  sorted = meetings.sort

  merged = [meetings.first]

  meetings.each do |curr_start, curr_end|
    prev_start, prev_end = merged[-1]

    if curr_start <= prev_end
      merged[-1] = [prev_start, curr_end]
    else
      merged << [curr_start, curr_end]
    end
  end

  merged
end

meetings1 = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]
meetings2 = [[1, 10], [2, 6], [3, 5], [7, 9]]

p merge_ranges(meetings1)# == [[0, 1], [3, 8], [9, 12]]
p merge_ranges(meetings2)# == [[1, 10]]
