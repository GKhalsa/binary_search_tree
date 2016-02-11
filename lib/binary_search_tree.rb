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

  # def load
  #   counter = 0
  #   File.open("./lib/movies.txt", "r") do |movie|
  #     binding.pry
  #     movie.each_line do |line|
  #       splitted_line = line.chomp.delete(' ').split(',')
  #       score = splitted_line[0].to_i
  #       movie_string = splitted_line[1]
  #       # Unless splitted_line[0] is included in tree, counter += 1
  #       # unless self.include?(score) == true
  #       # unless self.include?(score)
  #         insert(score, movie_string)
  #         #  counter += 1
  #       #  end
  #         #  counter += 1 unless include?(score) == false
  #           # insert(score, movie_string)
  #       #  end
  #     end
  #     counter
  #   end
  # end

end
