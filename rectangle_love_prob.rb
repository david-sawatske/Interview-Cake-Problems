# Write a function to find the rectangular intersection of two given love rectangles.
#
# Love rectangles are always "straight" and never "diagonal." Also, each side
# is parallel with either the x-axis or the y-axis.

# Rectanglgles are defined as hashes
# my_rectangle = {
#
#   # coordinates of bottom-left corner
#   'left_x' => 1,
#   'bottom_y' => 5,
#
#   # width and height
#   'width' => 10,
#   'height' => 4,
#
# }

# Time
# Space

def triangle_love(rect1, rect2)

end

rect1 = {
  left_x: 1,
  width: 10,
  bottom_y: 5,
  height: 4
}

rect2 = {
  left_x: 8,
  width: 4,
  bottom_y: 2,
  height: 4
}

p triangle_love(rect1, rect2) == {:left_x=>8, :width=>3, :bottom_y=>5, :height=>1}
