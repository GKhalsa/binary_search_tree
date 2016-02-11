require_relative '../lib/node.rb'
require 'minitest/autorun'
require 'minitest/pride'

class NodeTest < Minitest::Test

  def test_node_exists
    node = Node.new
    assert_equal Node, node.class
  end

  def test_node_can_hold_score
    node = Node.new(6)
    assert_equal 6, node.score
  end

  def test_node_is_initialized_with_nil_values
    node = Node.new
    assert_equal nil, node.score
    assert_equal nil, node.movie
    assert_equal nil, node.left_link
    assert_equal nil, node.right_link
  end

  def test_node_can_hold_movie
    node = Node.new(6,"The Matrix")
    assert_equal "The Matrix", node.movie
  end

  def test_adding_left_node
    node = Node.new(6, "The Matrix")
    node2 = Node.new(5, "Kontroll")
    node3 = Node.new(9, "Gataca")

    node.left_link = node2
    assert_equal node2, node.left_link
  end

  def test_adding_right_node
    node = Node.new(6, "The Matrix")
    node2 = Node.new(5, "Kontroll")
    node3 = Node.new(9, "Gataca")

    node.left_link = node2
    assert_equal node2, node.left_link
    node.right_link = node3
    assert_equal node3, node.right_link
  end

  def test_node_carries_over_score
    node = Node.new(6, "The Matrix")
    node2 = Node.new(5, "Kontroll")

    node.left_link = node2
    assert_equal 5, node.left_link.score
  end

  def test_node_carries_over_movie
    node = Node.new(6, "The Matrix")
    node2 = Node.new(5, "Kontroll")
    node3 = Node.new(9, "Gataca")

    node.left_link = node2
    assert_equal "Kontroll", node.left_link.movie
  end

  def test_getting_data_from_child_of_child
    node = Node.new(6, "The Matrix")
    node2 = Node.new(5, "Kontroll")
    node3 = Node.new(4, "Gataca")

    node.left_link = node2
    node2.left_link = node3
    assert_equal 'Gataca', node.left_link.left_link.movie
  end

end
