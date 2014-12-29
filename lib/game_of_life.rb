class GameOfLife
  DEFAULT_FILE = File.join(File.dirname(__FILE__), 'data', 'data.txt')

  class << self
    def play(data=nil)
      raw_data = data ? data : Parser.read_data(DEFAULT_FILE)
      array_2d = Parser.new(raw_data).to_2d_array
      population = Population.create(array_2d)
      current_gen = Generation.new(population)
      puts current_gen.next.population
    end
  end
end

