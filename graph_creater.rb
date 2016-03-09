class GraphCreater
  def initialize(node: nil, edge: nil, dim: 4)
    @node = node
    @edge = edge
    @dim  = dim
  end

  def edge_out_of_range?
    @node * (@node-1) / 2 < @edge ? true : false
  end

  def create_dim
    dim_array = []
    @dim.times do
      dim_array << random_num
    end
    dim_array
  end

  def random_num
    ('0'..'9').to_a.shuffle[0..7].join.to_f / 1000000
  end

end
