class World
  attr_reader :generation
  attr_reader :col_count

  def initialize(generation, col_count)
    @generation = generation
    @col_count = col_count
    @generation.freeze
    @col_count.freeze
  end

  def to_s
    counter, string = 0, ""
    current_gen = generation.sort_by { |position, cell| position }
    current_gen.each do |position, cell|
      counter += 1
      string += cell.alive? ? "| x " : "| . "
      if counter == col_count
        string += "|\n"
        counter = 0
      end
    end
    string
  end

  def self.create(data)
    data = refine(data)
    data = to_double_dimension_collection(data)
    col_count = data.first.count
    generation = assemble(data)
    World.new(generation, col_count)
  end

  private
    def add(position, cell)
    end

    def self.to_collection(data, separator)
      data.split(separator).reject(&:empty?)
    end

    def self.refine(data)
      data.delete(' ').delete('|')
    end

    def self.to_double_dimension_collection(data)
      data = to_collection(data, /\n/)
      data.collect { |row| to_collection(row, '') }
    end

    def self.assemble(array_2d)
      hash = {}
      array_2d.each_with_index do |row, i|
        row.each_with_index do |col, j|
          position = Position.new(j,i)
          cell = col.casecmp("X") == 0 ? LiveCell.instance : DeadCell.instance
          hash.merge!({position => cell})
        end
      end
      hash
    end
end
