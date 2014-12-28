class Generation

  attr_reader :col_count, :row_count
  def world; @world.clone; end #immutable

  def initialize(row_count, col_count)
    @world = {}
    @row_count, @col_count = row_count, col_count
    @row_count.freeze
    @col_count.freeze
  end

  def add(position, cell)
    @world.merge!({position => cell})
  end

  def to_s
    counter, string = 0, ""
    current_gen = world.sort_by { |position, cell| position }
    current_gen.each do |position, cell|
      counter += 1
      string += cell.alive? ? "| #{LiveCell::CHARACTER} " : "| #{DeadCell::CHARACTER} "
      if counter == col_count
        string += "|\n"
        counter = 0
      end
    end
    string
  end

  class << self
    def create(array_2d)
      generation = Generation.new(array_2d.count, array_2d.first.count)
      array_2d.each_with_index do |row, i|
        row.each_with_index do |col, j|
          position = Position.new(j,i)
          cell = col.casecmp(LiveCell::CHARACTER) == 0 ? LiveCell.instance : DeadCell.instance
          generation.add(position, cell)
        end
      end
      generation
    end
  end
end
