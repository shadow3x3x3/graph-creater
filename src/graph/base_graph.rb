class BaseGraph
  def make_node(id)
    raise NotImplementedError, "Implement this method in a child class"
  end

  def make_edge(id)
    raise NotImplementedError, "Implement this method in a child class"
  end
end