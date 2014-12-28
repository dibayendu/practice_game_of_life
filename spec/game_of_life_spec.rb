require 'spec_helper'

describe GameOfLife do
  let(:next_generation_data) { "| . | . | . |\n| . | . | . |\n| . | . | . |\n" }

  it "correct generation" do
    output = capture_stdout { GameOfLife.play }
    expect(output).to eql next_generation_data
  end
end

