require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/binary_search_tree.rb'

class BinarySearchTreeTest < Minitest::Test
  # attr_reader :tree
  # def setup
  #   @tree = BinarySearchTree.new
  # end

  def test_binary_search_tree_exists
    tree = BinarySearchTree.new
    assert_equal BinarySearchTree, tree.class
  end

  def test_bst_head_starts_at_nil
    tree = BinarySearchTree.new
    assert_equal nil, tree.head
  end

  def test_first_insert_will_create_head
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal Node, tree.head.class
  end

  def test_binary_search_tree_can_insert_second_node_as_left_node
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(51, "Gataca")
  end

end
