class Square
  attr_accessor :x, :y, :parent, :children

  def initialize x, y, parent = nil
    @x        = x
    @y        = y
    @parent   = parent
    @children = []
  end

  ## creates children for single instance (self) of Square object ##
  # children are square objects representing valid "knight" moves
  # for given Square(@x,@y)
  def make_children
    possible = []
    possible.push([@x+2, @y+1]).push([@x+2, @y-1]).push([@x+1, @y+2]).
             push([@x+1, @y-2]).push([@x-1, @y+2]).push([@x-1, @y-2]).
             push([@x-2, @y+1]).push([@x-2, @y-1])

    children = possible.select { |coord| coord[0] >= 0 && coord[0] <= 7 && coord[1] >= 0 && coord[1] <= 7 }

    children = children.map { |coord| Square.new(coord[0], coord[1], self) }
    @children = children
  end
end

## performs breadth first search through children of root Square for target ##
def search root, target
  queue = [root]

  until queue.empty?
    current = queue.shift
    return current if current.x == target.x && current.y == target.y

    current.make_children.each { |child| queue << child }
  end
end

## takes coordinates [x,y] of start and end ##
# returns a shortest route of "knight" moves between the two points
def track_route root_coords, target_coords
  root   = Square.new(root_coords[0], root_coords[1])
  target = Square.new(target_coords[0], target_coords[1])
  result = search(root, target)

  # initializes route array with target square's coordinates
  route = []
  route << [result.x, result.y]
  
  # backtraces through parents of search items, tracking their coordinates along the way
  current = result.parent
  until current.nil?
    route << [current.x, current.y]
    current = current.parent
  end
  # reverse route to put in 'playing' order for knight moves
  route.reverse!

  puts "You made it in #{route.length - 1} moves!  Here is your route:"
  route.each { |square| p square}
  return nil
end
