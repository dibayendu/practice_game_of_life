class Position
  include Comparable

  ROW = 0
  COL = 1

  attr_reader :col, :row
  def coordinates; return row, col; end
  def to_s; "#{row},#{col}"; end

  def initialize(row, col)
    @row, @col = row, col
    @row.freeze
    @col.freeze
  end

  def neighbours(row_limit, col_limit)
    valid_neighbouring_coordinates(row_limit, col_limit).
      collect { |cell| Position.new(*cell) }
  end

  def <=>(position)
    if row < position.row
      -1
    elsif row > position.row
      1
    elsif col < position.col
      -1
    elsif col > position.col
      1
    else
      0
    end
  end

  private
    def valid_neighbouring_coordinates(row_limit, col_limit)
      neighbouring_coordinates.select { |cell|
        cell[ROW] >= 0 && cell[ROW] < row_limit &&
        cell[COL] >= 0 && cell[COL] < col_limit
      }
    end

    def neighbouring_coordinates
      [
        [row-1, col-1], [row-1, col], [row-1, col+1],
        [row, col-1],   [row, col+1],
        [row+1, col-1], [row+1, col], [row+1, col+1]
      ]
    end
end
