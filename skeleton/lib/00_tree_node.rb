class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(val)
      @value = val
      @parent = nil
      @children = []
    end

    def parent=(new_parent)
      if @parent != new_parent && @parent != nil
        @parent.children.delete(self)
      end
      @parent = new_parent
      return nil if new_parent == nil
      if !new_parent.children.include?(self)
        @parent.children << self
      end
    end

    def add_child(child)
      child.parent = self
      if !@children.include?(child)
        @children << child
      end
    end

    def remove_child(child)
      if !@children.include?(child)
        raise "not child of this node"
      else 
        child.parent = nil
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