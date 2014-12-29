class Generation

  attr_reader :row_count, :col_count
  def population; @population.clone; end #immutable

  def initialize(row_count, col_count)
    # e.g. 2d[3][3] = [[{}, {}, {}], [{}, {}, {}], [{}, {}, {}]]
    @population = Array.new(row_count){Array.new(col_count, {})}
    @row_count, @col_count = row_count, col_count
    @row_count.freeze
    @col_count.freeze
  end

  def center_cell
    population[row_count/2][col_count/2][:cell]
  end

  def add(position, cell)
    @population[position.row][position.col] = { position: position, cell: cell }
  end

  def to_s
    string = ""
    population.each do |row|
      row.each { |data| string += data[:cell].to_s_grid }
      string += "|\n"
    end
    string
  end

  def next
    next_gen = Generation.new(row_count, col_count)
    population.each do |row|
      row.each do |data|
        neighbours = data[:position].neighbours(row_count, col_count)
        live_neighbours_count = neighbours.count { |p| population[p.row][p.col][:cell].alive? }
        next_life = data[:cell].next_generation(live_neighbours_count)
        next_gen.add(data[:position], next_life)
      end
    end
    next_gen
  end

  class << self
    def create(array_2d)
      generation = Generation.new(array_2d.count, array_2d.first.count)
      array_2d.each_with_index do |row, i|
        row.each_with_index do |col, j|
          position = Position.new(i,j)
          cell = Cell.create(col)
          generation.add(position, cell)
        end
      end
      generation
    end
  end
end

