require_relative "../skeleton/lib/00_tree_node.rb"
class KnightPathFinder

    attr_reader :root_node
    MOVES = [[1,2],[2,1],[-2,-1],[-1,-2],[1,-2],[2,-1],[-2,1],[-1,2]]
    def self.valid_moves(pos)
        possible_moves = []
        MOVES.each do |move|
            new_pos = pos.dup
            new_pos[0] += move[0]   
            new_pos[1] += move[1]
            if (0..7).include?(new_pos[0]) && (0..7).include?(new_pos[1])
                possible_moves << new_pos
            end
        end
        return possible_moves
    end

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        # build_move_tree
    end

    def build_move_tree
        line = [@root_node]
        while !line.empty?
            testing = line.shift
            children = new_move_positions(testing.value)
            children.each do |child|
                testing.add_child(PolyTreeNode.new(child))
            end
            line += testing.children
        end
    end

    def new_move_positions(pos)
        possible_moves = KnightPathFinder.valid_moves(pos) #Can Class be interchanged with KnightPathFinder
        possible_moves.reject! { |move| @considered_positions.include?(move)}
        @considered_positions += possible_moves 
        return possible_moves
    end
end
