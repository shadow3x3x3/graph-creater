class GraphCreater
  def initialize(node: nil, edge: nil, dim: 4)
    @node = node
    @edge = edge
    @dim  = dim
  end

  def edge_out_of_range?
    @node * (@node-1) / 2 < @edge ? true : false
  end

end
