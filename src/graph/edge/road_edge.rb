require_relative 'base_edge'

class RoadEdge < BaseEdge
  def initialize(id, src, dst)
    super(id, src, dst)
  end
end