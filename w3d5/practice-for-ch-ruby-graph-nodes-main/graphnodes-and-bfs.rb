require 'set'
require "byebug"
class GraphNode

    attr_accessor :value, :neighbors
    
    def initialize(value)
        @value = value
        @neighbors = []
        
    end

end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]



def bfs(node, target_value)
    #keeping track of whats been visited
    visited = Set.new
    #this is out FIFO queue that we add and remove to
    queue = [node]
    #adding each of the starting nodes neighbors to our queue
    node.neighbors.each do |neighbor|
        queue << neighbor
    end
    #this loops run until the queue is empty / queue.length == 0
    until queue.empty?
        #removes the first item from our queue, First in First out
        next_node = queue.shift
        # debugger
        #if this node has not been visited / AKA is not in our set, run the sub loop
        unless visited.include?(next_node)
            #if the nodes value == target node reutrn the node value
            if next_node.value == target_value
                return next_node.value
            end
            #if the above if statement is false, we add the node to our visited set
            visited.add(next_node)
            #we add the nodes neightbors to our queue
            queue += node.neighbors
        end
    end
    #return nil if our starting node cannot traverse to our target value
    nil    
end

p bfs(a, "b")
p bfs(a, "f")