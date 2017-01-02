require_relative 'base_graph'
require_relative 'node/road_node'
require_relative 'edge/road_edge'

class RoadGraphFactory < BaseGraph
  def make_node(id)
    return RoadNode.new(id)
  end

  def make_edge(id, src, dst)
    return RoadEdge.new(id, src, dst)
  end
end