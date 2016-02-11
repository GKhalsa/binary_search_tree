class Node
  attr_accessor :score, :movie, :left_link, :right_link, :depth
  def initialize(score = nil, movie = nil)
    @score = score
    @movie = movie
    @left_link = left_link
    @right_link = right_link
    @depth = 0
  end

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

  def depths(score)
    if @score == score
      depth
    elsif right_link.nil? && left_link.nil?
      nil
    elsif @score < score
      right_link.depths(score)
    elsif @score > score
      left_link.depths(score)
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
    if left_link == nil  #.nil?
      min_movie_hash[movie] = score
      min_movie_hash
    else
      left_link.min_score
    end
  end

  def sorter
    in_order = []
    in_order << left_link.sorter if left_link
    in_order << {movie => score}
    in_order << right_link.sorter if right_link
    in_order.flatten
  end

  def leaves
    leafy = []
    leafy << left_link.leaves if left_link
    leafy << right_link.leaves if right_link
    leafy << 1 if right_link.nil? && left_link.nil?
    leafy.flatten.reduce(:+)
  end

  def health(depth)
    find_nodes_at_certain_depth(depth).map { |node|   [node.score,node.search.flatten.count,floored_percentage(node)]}
  end

  def find_nodes_at_certain_depth(depth)
    a = []
    a << search
    a.flatten.find_all { |node| node.depth == depth }
  end

  def floored_percentage(node)
    ((node.search.flatten.count.to_f/self.search.flatten.count) * 100).floor
  end

  def search
    in_order = []
    in_order << left_link.search if left_link
    in_order << self
    in_order << right_link.search if right_link
    in_order
  end
end
