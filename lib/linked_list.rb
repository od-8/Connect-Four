# frozen_string_literal: false

require_relative '../lib/nodes'

# Class for linked list
class LinkedList
  attr_reader :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  # Adds item to end of list
  def append(item)
    new_node = Node.new(item, nil)

    if @head.nil?
      @head = new_node
    else
      @tail.next_node = new_node
    end

    @tail = new_node
    @size += 1
  end

  # At_index method
  def at_index(target_index, node = @head, current_index = 0)
    if target_index == current_index
      node
    else
      at_index(target_index, node.next_node, current_index + 1)
    end
  end

  # Checks if list contains node
  def contains?(value, node = @head)
    if node&.value.nil?
      false
    elsif value == node.value
      true
    else
      contains?(value, node.next_node)
    end
  end

  # Print the nodes so they are easy to understand

  def print_list
    nodes = []
    node = @head
    until node&.value.nil?
      nodes << "( #{node.value} )"
      node = node.next_node
    end
    nodes.join(' -> ').to_s
  end
end
