class CompleteGraph
  def generate(nodes_num, edges_num)
    compelete_edges(nodes_num)  
  end

  private 

  def compelete_edges(nodes_num)
    edges = []
    permutation_nodes = two_permutation_array(nodes_num)
    permutation_nodes.each do |node_pair|
      next if edges.include?([node_pair[1], node_pair[0]])
      edges << node_pair
    end
    edges = create_edges(edges)
  end

  def two_permutation_array(array)
    array.permutation(2).to_a
  end
end