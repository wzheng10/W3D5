class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(val)
      @value = val
      @parent = nil
      @children = []
    end

    def parent=(arg)
      if @parent != arg && @parent != nil
        @parent.children.delete(self)
      end
      @parent = arg
      return nil if arg == nil
      if !arg.children.include?(self)
        @parent.children << self
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