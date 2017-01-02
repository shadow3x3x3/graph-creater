require_relative 'base_graph'
require_relative 'node/sensor_node'
require_relative 'edge/sensor_edge'

class SensorGraphFactory < BaseGraph
  def make_node(id)
    return SensorNode.new(id)
  end

  def make_edge(id, src, dst)
    return SensorEdge.new(id, src, dst)
  end
end