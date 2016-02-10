class Node
  attr_accessor :score, :movie, :left_link, :right_link, :depth
  def initialize(score = nil, movie = nil)
    @score = score
    @movie = movie
    @left_link = left_link
    @right_link = right_link
    @depth = 0
  end

  #recursive method to bring nodes down the tree
  def tree_insertion(node)
    if left_link.nil? && score > node.score
      node.depth += 1
      @left_link = node
    elsif right_link.nil? && score < node.score
      node.depth += 1
      @right_link = node
    elsif score > node.score
      node.depth += 1
      @left_link.tree_insertion(node)
    elsif score < node.score
      node.depth += 1
      @right_link.tree_insertion(node)
    end
    node.depth
  end

  def inclusion(score)
    if @score == score
      true
    elsif right_link == nil && left_link == nil
      false
    elsif @score < score
      right_link.inclusion(score)
    elsif @score > score
      left_link.inclusion(score)
    else
      false
    end
  end


end
