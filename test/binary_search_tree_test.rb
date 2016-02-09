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

  def test_binary_search_tree_can_insert_second_node_as_left_child
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(51, "Gataca")
    assert_equal 51, tree.head.left_link.score
  end

  def test_bst_can_insert_second_node_as_right_child
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(71, "Gataca")
    assert_equal 71, tree.head.right_link.score
  end

  def test_bst_can_insert_left_and_right_child_under_head
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(51, "Gataca")
    tree.insert(70, "The Fountain")
    assert_equal 51, tree.head.left_link.score
    assert_equal 70, tree.head.right_link.score
  end

  def test_bst_insert_left_link_under_left_link
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(51, "Gataca")
    tree.insert(40, "The Fountain")
    assert_equal 40, tree.head.left_link.left_link.score
  end

  def test_bst_insert_right_link_under_right_link
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(70, "Gataca")
    tree.insert(80, "The Fountain")
    assert_equal 80, tree.head.right_link.right_link.score
  end

  def test_bst_insert_right_link_under_left_link
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(70, "Gataca")
    tree.insert(68, "The Fountain")
    assert_equal 68, tree.head.right_link.left_link.score
  end

end
