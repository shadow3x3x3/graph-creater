class GraphCreater
  def initialize(node: nil, edge: nil, dim: 4)
    @node   = node
    @edge   = edge
    @dim    = dim
    @result = self.create
  end

  def create
    result_array  = []
    created_edges = 0
    current_node  = 0

    # find all nodes
    until created_edges == @edge
      current = 0 if current_node == @node
      current_node += 1
      connect_node  = 0
      # find all nodes that may connect
      until connect_node == @node || created_edges == @edge
        connect_node += 1
        next if current_node == connect_node # no loop self
        # connect or not
        if rand(4) == 0
          created_edges += 1
          result_array << [current_node, connect_node]
        end
      end
    end # find all nodes end

    result_array
  end

  def show_edges
    p @result
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
