require_relative "../skeleton/lib/00_tree_node.rb"
class KnightPathFinder

    MOVES = [[1,2],[2,1],[-2,-1],[-1,-2],[1,-2],[2,-1],[-2,1],[-1,2]]
    def self.valid_moves(pos)
        
    end

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        build_move_tree
    end

    def build_move_tree

    end

    def new_move_positions(pos)
        Class.valid_moves(pos) #Can Class be interchanged with KnightPathFinder

    end
end
