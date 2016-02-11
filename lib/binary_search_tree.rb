require_relative 'node.rb'

class BinarySearchTree
  attr_reader :movie_count, :node, :depth, :head
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
    head.nil? ? nil : head.depths(score)
  end

  def max
    head.nil? ? nil : head.max_score
  end

  def min
    head.nil? ? nil : head.min_score
  end

  def sort
    head.nil? ? nil : head.sorter
  end

  def health(depth)
    head.nil? ? nil : head.health(depth)
  end

  def leaves
    head.nil? ? nil : head.leaves
  end

  def count_verification
    head.nil? ? nil : head.input_movie_count
  end

  def load(file)
    movies = File.open(file, "r")
    load_each_movie(movies)
    count_verification
  end

  def load_each_movie(movies)
    movies.each_line do |line|
      splitted_line = line.chomp.split(',')
      injection(splitted_line)
    end
  end

  def injection(splitted_line)
    score = splitted_line[0].to_i
    movie_string = splitted_line[1]
    insert(score, movie_string)
  end

end
