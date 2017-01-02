require_relative 'src/graph_generator'
require_relative 'src/graph/road_graph_factory'
require_relative 'src/graph/sensor_graph_factory'
require_relative 'src/graph/social_graph_factory'

graph_generator = GraphGenerator.new
road_graph_factory = RoadGraphFactory.new 

graph_generator.create(road_graph_factory node_num: 4, edge_num: 5)
