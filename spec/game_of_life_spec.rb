require 'spec_helper'

describe GameOfLife do

  subject { GameOfLife.new }

  it "correct generation" do
    next_generation_data = "| . | . | . |\n| . | . | . |\n| . | . | . |\n"
    subject.setup_generation_from_file
    expect(subject.next_generation.to_s).to eql next_generation_data
  end

  it "second correct generation" do
    cur_gen_data = "| . | . | . |\n| x | x | x |\n| . | . | . |\n"
    nex_gen_data = "| . | x | . |\n| . | x | . |\n| . | x | . |\n"
    subject.setup_generation_from_raw_data(cur_gen_data)
    expect(subject.next_generation.to_s).to eql nex_gen_data
  end
end

