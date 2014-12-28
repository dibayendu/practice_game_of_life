class GameOfLife
  DEFAULT_FILE = File.join(File.dirname(__FILE__), 'data', 'data.txt')

  class << self
    def play(data=nil)
      raw_data = data ? data : Parser.read_data(DEFAULT_FILE)
      array_2d = Parser.new(raw_data).to_2d_array
      current_gen = Generation.create(array_2d)
      puts current_gen.next
    end
  end
end

