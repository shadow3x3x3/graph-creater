class RandomGraph
  def generator(nodes_num, edges_num)
    random_edges(nodes_num, edges_num)
  end
  
  private

  def random_edges(nodes_num, edges_num)
    edges = []
    permutation_nodes = two_permutation_array(nodes_num).shuffle
    edges = create_edges(permutation_nodes.pop(edges_num))
  end

  def two_permutation_array(array)
    array.permutation(2).to_a
  end
end