require "spec_helper"
require_relative "../graph_creater.rb"

describe GraphCreater do

  describe "edge check" do
    it "edges out of range" do
      gc = GraphCreater.new(node: 2, edge: 3, dim: 4)
      expect(gc.edge_out_of_range?).to be true
    end

    it "edges not out of range" do
      gc = GraphCreater.new(node: 3, edge: 3, dim: 4)
      expect(gc.edge_out_of_range?).to be false
    end
  end


end
