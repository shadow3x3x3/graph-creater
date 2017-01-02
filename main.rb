require_relative 'src/graph_generator'

require_relative 'src/graph/road_graph_factory'
require_relative 'src/graph/sensor_graph_factory'
require_relative 'src/graph/social_graph_factory'

require_relative 'src/type/random_graph'
require_relative 'src/type/connectivity_graph'
require_relative 'src/type/complete_graph'

graph_generator = GraphGenerator.new(node_num: 4, edge_num: 5) 

graph_generator.generate(RoadGraphFactory.new, CompleteGraph.new)