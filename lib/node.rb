class Node
  attr_accessor :num, :movie, :left_link, :right_link
  def initialize(num = nil, movie = nil, left_link = nil, right_link = nil)
    @num = num
    @movie = movie
    @left_link = left_link
    @right_link = right_link
  end
end
