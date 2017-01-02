class GraphGenerator
  def initialize(nodes_num: nil, edges_num: nil, dim: 4)
    raise "edges nums is too much." if edge_out_of_range?(nodes_num, edges_num)
    @nodes_num = nodes_num
    @edges_num = edges_num
    @dim       = dim
  end

  def generator(factory, graph_type)
    @factory = factory

    @nodes = create_nodes(@nodes_num)
    @edges = create_edges(graph_type.generator(@nodes_nums, @edges_num))
    add_dim(@edges)
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

  def add_dim(edges)
    edges.map do |edge|
      dims = []
      @dim.times { dims << random_num(4) }
      edge.add_dim(dims)
    end
  end

  def edge_out_of_range?(nodes_num, edges_num)
    nodes_num * (nodes_num - 1) / 2 < edges_num
  end

  def random_num(size)
    ('0'..'9').to_a.sample(size).join.to_f
  end
end