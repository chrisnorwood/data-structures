class Square
  attr_accessor :x, :y, :parent, :children

  def initialize x, y, parent = nil
    @x = x
    @y = y
    @parent = parent
    @children = []
  end

  def make_children
    possible = []
    possible.push([@x+2, @y+1]).push([@x+2, @y-1]).push([@x+1, @y+2]).
             push([@x+1, @y-2]).push([@x-1, @y+2]).push([@x-1, @y-2]).
             push([@x-2, @y+1]).push([@x-2, @y-1])

    children = possible.select { |coord| coord[0] >= 0 && coord[0] <= 7 && coord[1] >= 0 && coord[1] <= 7 }

    children = children.map { |coord| Square.new(coord[0], coord[1]) }
    @children = children
  end
end

def search root, target
end

def track_route
end