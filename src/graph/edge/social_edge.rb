require_relative 'base_edge'

class SocialEdge < BaseEdge
  def initialize(id, src, dst)
    super(id, src, dst)
  end
end