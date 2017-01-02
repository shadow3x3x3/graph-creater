class GeneralGraph
  def generate(nodes_num, edges_num)
    raise NotImplementedError, "Implement this method in a child class"
  end

  protected

  def two_permutation_array(array)
    array.permutation(2).to_a
  end
end