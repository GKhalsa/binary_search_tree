class Node
  attr_accessor :score, :movie, :left_link, :right_link
  def initialize(score = nil, movie = nil)
    @score = score
    @movie = movie
    @left_link = left_link
    @right_link = right_link
  end

  #recursive method to bring nodes down the tree
  def tree_insertion(node)
    if left_link.nil? && score > node.score
      @left_link = node
      # binding.pry
    elsif right_link.nil? && score < node.score
      @right_link = node
    end
  end
end
