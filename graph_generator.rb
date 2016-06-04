require_relative './utils/file_io'
# Create Graph
class GraphGenerator
  attr_reader :any_graph

  include FileIO

  def initialize(nodes_limit: nil, edges_limit: nil, dim: 4)
    raise 'Edges out of range' if edge_out_of_range?(nodes_limit, edges_limit)
    @nodes_limit = nodes_limit
    @edges_limit = edges_limit
    @dim         = dim
    @nodes       = create_nodes
  end

  def random_graph
    add_dim(random_edges(@nodes))
  end

  def complete_graph
    add_dim(compelete_edges(@nodes))
  end

  def directed_graph
    add_dim(directed_edges(@nodes))
  end

  private

  def create_nodes
    [].tap do |nodes|
      0.upto(@nodes_limit - 1) { |node| nodes << node }
    end
  end

  def random_edges(nodes)
    permutation_nodes = two_permutation_array(nodes).shuffle
    permutation_nodes.pop(@edges_limit)
  end

  def compelete_edges(nodes)
    final = []
    permutation_nodes = two_permutation_array(nodes)
    permutation_nodes.each do |node_pair|
      next if final.include?([node_pair[1], node_pair[0]])
      final << node_pair
    end
    final
  end

  def add_dim(edges)
    final_graph = []
    edges.each do |edge|
      edge_with_dim = []
      edge_with_dim << edge
      edge_with_dim.flatten!
      @dim.times { edge_with_dim << random_num(4) }
      final_graph << edge_with_dim
    end
    final_graph
  end

  def two_permutation_array(array)
    array.permutation(2).to_a
  end

  def edge_out_of_range?(nodes_limit, edges_limit)
    nodes_limit * (nodes_limit - 1) / 2 < edges_limit ? true : false
  end

  def random_num(size)
    ('0'..'9').to_a.sample(size).join.to_f
  end
end

gc = GraphGenerator.new(nodes_limit: 6, edges_limit: 6)
result = gc.complete_graph
gc.write_to_txt(file_name: 'complete', data: result)
gc.write_to_txt(data: result)
