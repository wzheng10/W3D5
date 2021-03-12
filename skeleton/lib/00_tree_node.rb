require "byebug"
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

    def inspect
      "#<PolyTreeNode:#{self.value}, child:#{self.children.map(&:value)}>"
    end

    def dfs(target)
      return nil if self.children.empty? && self.value != target
      
      # debugger
      self.children.each do |child|
        leaf = child.dfs(target)
        if leaf != nil
          return leaf
        end
      end
      return self if self.value == target
      return nil
    end

end

#     1(a) 
#  2(b)    3(c) 
#4(d)  5(e)  6(t)

# a.dfs(f) = 6
# 2b.dfs(f) = nil
# 3c.dfs(f) = 6

# let(:node1) { PolyTreeNode.new('root') }
# let(:node2) { PolyTreeNode.new('child1') }
# let(:node3) { PolyTreeNode.new('child2') }
