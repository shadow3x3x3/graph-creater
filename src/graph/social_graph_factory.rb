require_relative 'base_graph'
require_relative 'node/social_node'
require_relative 'edge/social_edge'

class SocialGraphFactory < BaseGraph
  def make_node(id)
    return SocialNode.new(id)
  end

  def make_edge(id, src, dst)
    return SocialEdge.new(id, src, dst)
  end
end