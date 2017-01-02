class GraphGenerator
  def initialize(nodes_num: nil, edges_num: nil, dim: 4)
    @factory   = factory
    @nodes_num = nodes_num
    @edges_num = edges_num
    @dim       = dim

    @nodes = create_nodes(nodes_num)
  end

  def random_graph
    add_dim(random_edges(@nodes_num))
  end

  def complete_graph
    add_dim(compelete_edges(@nodes_num))
  end

  def connectivity_graph
    unless can_be_connectivity?(@nodes_num, @edges_num)
      raise ArgumentError, "#{@edges_num} edges can't be connectivited in #{@nodes_num} nodes"
    end
    add_dim(connectivity_edges(@nodes))
  end

  private

  def create_nodes(nums)
    [].tap do |nodes|
      1.upto(nums) { |node| nodes << @factory.make_node(node) }
    end
  end

  def create_edges(edge_array)
    edge_array.map.with_index do |e, i|
      @factory.make_edge(i, e[0], e[1])
    end
  end

  def random_edges(nodes)
    edges = []
    permutation_nodes = two_permutation_array(nodes).shuffle
    @edges = create_edges(permutation_nodes.pop(@edges_num))
  end

  def compelete_edges(nodes)
    edges = []
    permutation_nodes = two_permutation_array(nodes)
    permutation_nodes.each do |node_pair|
      next if edges.include?([node_pair[1], node_pair[0]])
      edges << node_pair
    end
    @edges = create_edges(edges)
  end

  def connectivity_edges(nodes)
    nodes.shuffle!
    part_graph = nodes.each.with_index.each_with_object([]) do |(n, i), f|
      f << [n, nodes[i + 1]] unless i == nodes.size - 1
      f
    end
    add_lacking_edges(part_graph)
    create_edges(part_graph)
  end

  def add_lacking_edges(part_graph)
    permutation_nodes = two_permutation_array(@nodes)
    until part_graph.size == @edges_num
      r1, r2 = permutation_nodes.pop
      next if part_graph.include?([r2, r1]) || part_graph.include?([r1, r2])
      part_graph << [r1, r2]
    end
    part_graph
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

  def edge_out_of_range?(nodes_num, edges_num)
    nodes_num * (nodes_num - 1) / 2 < edges_num
  end

  def can_be_connectivity?(nodes_num, edges_num)
    edges_num >= nodes_num - 1
  end

  def random_num(size)
    ('0'..'9').to_a.sample(size).join.to_f
  end
end