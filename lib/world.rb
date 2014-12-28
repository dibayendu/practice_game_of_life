class World

  attr_reader :col_count, :row_count
  def generation; @generation.clone; end #immutable

  def initialize(row_count, col_count)
    @generation = {}
    @row_count, @col_count = row_count, col_count
    @row_count.freeze
    @col_count.freeze
  end

  def add(position, cell)
    @generation.merge!({position => cell})
  end

  def to_s
    counter, string = 0, ""
    current_gen = generation.sort_by { |position, cell| position }
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

  def self.create(array_2d)
    world = World.new(array_2d.count, array_2d.first.count)
    array_2d.each_with_index do |row, i|
      row.each_with_index do |col, j|
        position = Position.new(j,i)
        cell = col.casecmp(LiveCell::CHARACTER) == 0 ? LiveCell.instance : DeadCell.instance
        world.add(position, cell)
      end
    end
    world
  end
end
