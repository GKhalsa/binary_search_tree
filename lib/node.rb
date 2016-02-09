class Node
  attr_accessor :score, :movie, :left_link, :right_link
  def initialize(score = nil, movie = nil, left_link = nil, right_link = nil)
    @score = score
    @movie = movie
    @left_link = left_link
    @right_link = right_link
  end
end
