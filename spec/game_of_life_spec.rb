require 'spec_helper'

describe GameOfLife do
  it "correct generation" do
    next_generation_data = "| . | . | . |\n| . | . | . |\n| . | . | . |\n"
    output = capture_stdout { GameOfLife.play }
    expect(output).to eql next_generation_data
  end

  it "second correct generation" do
    cur_gen_data = "| . | . | . |\n| x | x | x |\n| . | . | . |\n"
    nex_gen_data = "| . | x | . |\n| . | x | . |\n| . | x | . |\n"
    output = capture_stdout { GameOfLife.play(cur_gen_data) }
    expect(output).to eql nex_gen_data
  end
end

