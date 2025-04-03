# Class for nodes inside linked list
class Node
  attr_accessor :value, :next_node

  def initialize(val, node)
    @value = val
    @next_node = node
  end
end
