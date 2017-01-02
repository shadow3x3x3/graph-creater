require_relative 'general_graph'

class ConnectivityGarph < GeneralGraph
  def generate(nodes_num, edges_num)
    @edges_num = edges_num
    unless can_be_connectivity?(nodes_num, edges_num)
      raise ArgumentError, "#{@edges_num} edges can't be connectivited in #{@nodes_num} nodes"
    end
    connectivity_edges(nodes_num)
  end

  private

  def connectivity_edges(nodes_num)
    nodes_num.shuffle!
    part_graph = nodes_num.each.with_index.each_with_object([]) do |(n, i), f|
      f << [n, nodes_num[i + 1]] unless i == nodes_num.size - 1
      f
    end
    add_lacking_edges(part_graph)
    create_edges(part_graph)
  end

  def can_be_connectivity?(nodes_num, edges_num)
    edges_num >= nodes_num - 1
  end

  def add_lacking_edges(part_graph)
    permutation_nodes = two_permutation_array(nodes_num)
    until part_graph.size == @edges_num
      r1, r2 = permutation_nodes.pop
      next if part_graph.include?([r2, r1]) || part_graph.include?([r1, r2])
      part_graph << [r1, r2]
    end
    part_graph
  end
end