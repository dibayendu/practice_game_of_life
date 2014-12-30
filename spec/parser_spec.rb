require 'spec_helper'

describe Parser do
  include_context 'positions'

  let(:parser) { Parser.new(data) }
  let(:file)   { File.join(File.dirname(__FILE__), 'fixtures', 'data.txt') }

  it "gives parsed 2D collection" do
    expect(parser.to_2d_array).to eql(array_2d)
  end

  context "#read_data" do
    context "file does not exist" do
      it { expect{Parser.read_data("blah")}.to raise_error(FileError) }
    end
    context "file exists" do
      it { expect(Parser.read_data(file)).to eql data }
    end
  end
end
