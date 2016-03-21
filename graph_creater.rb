class GraphCreater
  def initialize(node: nil, edge: nil, dim: 4, type: nil)
    @node   = node
    @edge   = edge
    @dim    = dim
    if type == nil
      @type = "simple"
    else
      @type = type
    end
    any_edges  = self.create_any
    @any_graph = add_dim(any_edges)
    raise "Edges out of range" if edge_out_of_range?
  end

  def create_any
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
    p @any_graph
  end

  def edge_out_of_range?
    @node * (@node-1) / 2 < @edge ? true : false
  end

  def add_dim(edges_array)
    final_graph = []
    edges_array.each do |edge|
      edge_with_dim = []
      edge_with_dim << edge
      edge_with_dim.flatten!
      @dim.times do
        edge_with_dim << random_num
      end
      final_graph << edge_with_dim
    end

    final_graph
  end


  def random_num
    ('0'..'9').to_a.shuffle[0..7].join.to_f / 1000000
  end

end
