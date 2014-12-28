require 'spec_helper'

describe Parser do
  include_context 'positions'

  let(:parser) { Parser.new(data) }
  let(:file)   { File.join(File.dirname(__FILE__), 'fixtures', 'data.txt') }

  it "gives parsed 2D collection" do
    expect(parser.to_2d_array).to eql(array_2d)
  end

  it "reads data from file" do
    file_data = Parser.read_data(file)
    expect(file_data).to eql data
  end
end
