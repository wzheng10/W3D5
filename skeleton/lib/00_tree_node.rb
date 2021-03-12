class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(val)
      @value = val
      @parent = nil
      @children = []
    end

    def parent=(arg)
      @parent = arg
      if !arg.children.include?(self)
        @parent.children << self
      else
        return nil
      end
    end

end


#node1 {djalkthgjeajrtkldhf;jsalkf value="root" parent=nil children=[node2]} 

#node2 {djalkthgjeajrtkldhf;jsalkf value="child1" parent=node1 children=[]}

# self = node2

# def parent=(node1)
#   @parent = node1
#   @parent.children << self 
# end