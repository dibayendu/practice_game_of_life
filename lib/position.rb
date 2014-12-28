class Position
  include Comparable

  X = 0
  Y = 1

  attr_reader :x, :y
  def coordinates; return x, y; end
  def to_s; "#{x},#{y}"; end

  def initialize(x, y)
    @x, @y = x, y
    @x.freeze
    @y.freeze
  end

  def neighbours(x_limit, y_limit)
    valid_neighbouring_coordinates(x_limit, y_limit).
      collect { |cell| Position.new(*cell) }
  end

  def <=>(position)
    if y < position.y
      -1
    elsif y > position.y
      1
    elsif x < position.x
      -1
    elsif x > position.x
      1
    else
      0
    end
  end

  private
    def valid_neighbouring_coordinates(x_limit, y_limit)
      neighbouring_coordinates.select { |cell|
        cell[X] >= 0 && cell[X] < x_limit &&
        cell[Y] >= 0 && cell[Y] < y_limit
      }
    end

    def neighbouring_coordinates
      [
        [x-1, y-1], [x, y-1], [x+1, y-1],
        [x-1, y],   [x+1, y],
        [x-1, y+1], [x, y+1], [x+1, y+1]
      ]
    end
end
