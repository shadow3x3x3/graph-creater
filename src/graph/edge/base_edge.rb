class BaseEdge
  attr_reader :id

  def initialize(id, src, dst)
    @id  = id
    @src = src
    @dst = dst
    @dim = []
  end

  def add_dim(new_dim)
    @dim << new_dim
  end
end