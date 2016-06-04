# Graph-Generator

Using Ruby for generating [Graph](https://en.wikipedia.org/wiki/Graph_theory) that is Simple Graph.

This Generator not only generates the nodes and edges but generates attribute(s) (Dimensions) on every edges.

This Generator should make sure input nodes number and edges number before generating.

Using `GraphGenerator.new(nodes_num: 6, edges_num: 10)` for initialize the Generator.

Using `write_to_txt(file_name: 'complete', data: result)` can  output txt file with generating Graph. If file name is empty, and than default name is current time.

## Features
* Random Graph with nodes and edges
```ruby
  gc = GraphGenerator.new(nodes_num: 6, edges_num: 10)
  gc.random_graph
```

* [Complete Graph](https://en.wikipedia.org/wiki/Complete_graph) with nodes
```ruby
  gc = GraphGenerator.new(nodes_num: 6)
  gc.complete_graph
```
You don't need to set `edges_num` if you want to generate Complete Graph.
If you set `edges_num`, it will be ignore.

* [Connectivity](https://en.wikipedia.org/wiki/Connectivity_%28graph_theory%29) with nodes and edges
```ruby
  gc = GraphGenerator.new(nodes_num: 6)
  gc.connectivity_graph
```
