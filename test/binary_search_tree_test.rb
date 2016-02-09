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

  def test_you_cannot_add_duplicate_score
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(70, "Gataca")
    tree.insert(70, "The Fountain")
    tree.insert(70, "The Matrix")
    assert_equal "Gataca", tree.head.right_link.movie
    assert_equal nil, tree.head.right_link.right_link
    assert_equal nil, tree.head.right_link.left_link
  end

  def test_adding_a_node_returns_a_depth
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.insert(16, "Johnny English")
  end

  def test_adding_4_nodes_returns_correct_depth
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.insert(65, "Johnny English")
    assert_equal 2, tree.insert(68, "Shorter Movie")
    assert_equal 3, tree.insert(70, "Turing")
  end
  def test_does_the_tree_include_a_head_score
    tree = BinarySearchTree.new
    tree.insert(16, "Gattaca")
    assert_equal true, tree.include?(16)
  end

  meta single: true
  def test_does_the_tree_include_a_child_score
    tree = BinarySearchTree.new
    tree.insert(16, "Gattaca")
    tree.insert(40, "Saw")
    assert_equal true, tree.include?(16)
    assert_equal true, tree.include?(40)
  end

  def test_returns_false_if_score_is_not_there
    tree = BinarySearchTree.new
    tree.insert(16, "Gattaca")
    tree.insert(39, "Saw")
    tree.insert(50, "The Matrix")
    tree.insert(40, "Big Fish")
    assert_equal true, tree.include?(16)
    assert_equal true, tree.include?(40)
    assert_equal false, tree.include?(20)
  end
end
