require_relative 'node.rb'
require 'pry'

class BinarySearchTree
  attr_accessor :node, :head
  def initialize
    @head = head
  end

  def insert(score, movie)
    node = Node.new(score, movie)
    if @head.nil?
      @head = node
    else
      @head.tree_insertion(node)
    end
  end

end
