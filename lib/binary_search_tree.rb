require_relative 'node.rb'
require 'pry'

class BinarySearchTree
  attr_accessor :node, :head, :depth
  def initialize
    @head = head
    # @depth = 0
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

  def include?(score)  #make a search method in a search g
    if head.score == score
      true
    elsif head.left_link == nil && head.right_link == nil
      false
    elsif head.score < score
      @head = head.right_link
      include?(score)
    elsif head.score > score
      @head = head.left_link
      include?(score)
    else
      false
    end
  end

end
