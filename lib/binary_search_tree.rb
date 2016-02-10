require_relative 'node.rb'
require 'pry'

class BinarySearchTree
  attr_accessor :node, :depth, :head
  def initialize
    @head = head
  end

  def insert(score, movie)
    node = Node.new(score, movie)
    if head.nil?
      @head = node
      node.depth
    else
      head.tree_insertion(node)
    end
  end


  def include?(score)
    head.nil? ? false : head.inclusion(score)
  end

  def depth_of(score)
    if include?(score)
      head.depth
    else
      nil
    end
  end



end
