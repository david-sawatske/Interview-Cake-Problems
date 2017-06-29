# Here's a formal algorithm:
#
# We treat the meeting with earlier start time as "first," and the other as "second."
# If the end time of the first meeting is equal to or greater than the start
# time of the second meeting, we merge the two meetings into one time range. The
# resulting time range's start time is the first meeting's start, and its end
# time is the later of the two meetings' end times.
# Else, we leave them separate.

# So we could sort our meetings, then walk through the sorted array and see if
# each meeting can be merged with the one after it.

# Then we walk through our sorted meetings from left to right. At each step, either:
#
# 1. We can merge the current meeting with the previous one, so we do.
# 2. We can't merge the current meeting with the previous one, so we know the
#    previous meeting can't be merged with any future meetings and we throw the
#    current meeting into merged_meetings.

# O(nlgn) time and O(n)O(n) space.
# Even though we only walk through our array of meetings once to merge them, we
# sort all the meetings first, giving us a runtime of O(n\lg{n})O(nlgn). It's
# worth noting that if our input were sorted, we could skip the sort and do
# this in O(n) time!

def merge_ranges(meetings)

  # sort by start times
  sorted_meetings = meetings.sort

  # initialize merged_meetings with the earliest meeting
  merged_meetings = [sorted_meetings[0]]

  sorted_meetings[1..-1].each do |current_meeting_start, current_meeting_end|

    last_merged_meeting_start, last_merged_meeting_end = merged_meetings[-1]

    # if the current and last meetings overlap, use the latest end time
    if current_meeting_start <= last_merged_meeting_end
      merged_meetings[-1] = [last_merged_meeting_start, [last_merged_meeting_end, current_meeting_end].max]

    # add the current meeting since it doesn't overlap
    else
      merged_meetings.push([current_meeting_start, current_meeting_end])
    end
  end

  return merged_meetings
end

meetings1 = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]
meetings2 = [[1, 10], [2, 6], [3, 5], [7, 9]]

p merge_ranges(meetings1) == [[0, 1], [3, 8], [9, 12]]
p merge_ranges(meetings2) == [[1, 10]]
