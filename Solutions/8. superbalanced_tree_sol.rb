# Simplify the requirements to the two possible cases
# "The difference between the min leaf depth and the max leaf depth is 1 or less"
# "There are at most two distinct leaf depths, and they are at most 1 apart"

# We can do this in O(n) time and O(n) space.

# Depth-first and breadth-first are common ways to traverse a tree.
# Which one should we use here? (time and space costs of both are the same)
# => Depth-first traversal will generally hit leaves before breadth-first

# We do a depth-first walk through our tree, keeping track of the depth as we
# go. When we find a leaf, we throw its depth into an array of depths if we
# haven't seen that depth already.

# Each time we hit a leaf with a new depth, there are two ways that our tree
# might now be unbalanced:

# 1. There are more than 2 different leaf depths
# 2. There are exactly 2 leaf depths and they are more than 1 apart.

class BinaryTreeNode
  attr_accessor :value
  attr_reader :left, :right

  def initialize(value)
    @value = value
    @left  = nil
    @right = nil
  end

  def insert_left(value)
    @left = BinaryTreeNode.new(value)
    @left
  end

  def insert_right(value)
    @right = BinaryTreeNode.new(value)
    @right
  end

  def is_balanced(tree_root)
    # a tree with no nodes is superbalanced, since there are no leaves!
    return true unless tree_root

    depths = [] # we short-circuit as soon as we find more than 2

    # we'll treat this array as a stack that will store pairs [node, depth]
    nodes = []
    nodes.push([tree_root, 0])

    until nodes.empty?

      # pop a node and its depth from the top of our stack
      node, depth = nodes.pop

      # case: we found a leaf
      if !node.left && !node.right

        # we only care if it's a new depth
        unless depths.include?(depth)
          depths.push(depth)

          # two ways we might now have an unbalanced tree:
          #   1) more than 2 different leaf depths
          #   2) 2 leaf depths that are more than 1 apart
          if (depths.length > 2) || \
             (depths.length == 2 && (depths[0] - depths[1]).abs > 1)
            return false
          end
        end

      # case: this isn't a leaf - keep stepping down
      else
        nodes.push([node.left, depth + 1]) if node.left
        nodes.push([node.right, depth + 1]) if node.right
      end
    end

    true
  end
end
