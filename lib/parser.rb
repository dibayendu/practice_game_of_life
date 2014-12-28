class Parser
  attr_reader :data

  def initialize(data)
    @data = data
  end

  class << self
    def read_data(file)
      File.read(file)
    end
  end

  def to_2d_array
    refined_data = data.delete(' ').delete('|')
    collection_1d = to_collection(refined_data, /\n/)
    collection_1d.collect { |row| to_collection(row, '') }
  end

  private
    def to_collection(data, separator)
      data.split(separator).reject(&:empty?)
    end
end
