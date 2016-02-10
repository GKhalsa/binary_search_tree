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

  def depth_search(score)
    if @score == score
      depth
    elsif right_link.nil? && left_link.nil?
      nil
    elsif @score < score
      right_link.depth_search(score)
    elsif @score > score
      left_link.depth_search(score)
    else
      nil
    end
  end

  def max_score
    max_movie_hash = {}
    if right_link == nil
      max_movie_hash[movie] = score
      max_movie_hash
    else
      right_link.max_score
    end
  end

  def min_score
    min_movie_hash = {}
    if left_link == nil
      min_movie_hash[movie] = score
      min_movie_hash
    else
      left_link.min_score
    end
  end



end
