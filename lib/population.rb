class Population

  attr_reader :row_count, :col_count
  def grid; @grid.clone; end #immutable

  def initialize(row_count, col_count)
    # e.g. [3][3] = [[{}, {}, {}], [{}, {}, {}], [{}, {}, {}]]
    @grid = Array.new(row_count){Array.new(col_count, {})}
    @row_count, @col_count = row_count, col_count
  end

  def center_cell
    @grid[row_count/2][col_count/2][:cell]
  end

  def add(position, cell)
    @grid[position.row][position.col] = { position: position, cell: cell }
  end

  def to_s
    string = ""
    grid.each do |row|
      row.each { |data| string += data && !data.empty? ? data[:cell].to_s_grid : "" }
      string += "|\n"
    end
    string
  end

  def to_a
    array = Array.new(row_count){Array.new(col_count)}
    grid.each_with_index do |row, i|
      row.each_with_index { |data, j| array[i][j] = data[:cell].to_s }
    end
    array
  end

  class << self
    def create(array_2d)
      population = Population.new(array_2d.count, array_2d.first.count)
      array_2d.each_with_index do |row, i|
        row.each_with_index do |col, j|
          position = Position.new(i,j)
          cell = Cell.create(col)
          population.add(position, cell)
        end
      end
      population.grid.freeze
      population
    end
  end
end
