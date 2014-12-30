class GameOfLife
  DEFAULT_FILE = File.join(File.dirname(__FILE__), 'data', 'data.txt')

  def generation
    generation_exist { @generation = @generation.clone }
  end

  def setup_generation_from_file(file=DEFAULT_FILE)
    data = Parser.read_data(file)
    setup_generation_from_raw_data(data)
  end

  def setup_generation_from_raw_data(data)
    @raw_data = data
    table = Parser.new(data).to_2d_array
    setup_generation(table)
  end

  def setup_generation(table)
    population = Population.create(table)
    @generation = Generation.new(population)
  end

  def next_generation
    generation_exist { @generation = @generation.next }
  end

  private
    def generation_exist(&block)
      if @generation
        yield
      else
        raise GenerationError.new("No current generation found! Setup generation first.")
      end
    end
end

