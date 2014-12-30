require 'forwardable'

class Generation
  extend Forwardable

  attr_reader :population

  def initialize(population)
    @population = population
  end

  def_delegator :@population, :to_s

  def next
    row_count = population.row_count
    col_count = population.col_count
    next_population = Population.new(row_count, col_count)
    population.grid.each do |row|
      row.each do |data|
        neighbours = data[:position].neighbours(row_count, col_count)
        live_neighbours_count = neighbours.count { |p|
          population.grid[p.row][p.col][:cell].alive?
        }
        next_life_cell = data[:cell].next_generation(live_neighbours_count)
        next_population.add(data[:position], next_life_cell)
      end
    end
    Generation.new(next_population)
  end
end

