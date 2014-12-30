require 'spec_helper'

describe GameOfLife do
  include_context 'positions'

  subject { GameOfLife.new }

  context "#generation" do
    it { expect{subject.generation}.to raise_error(GenerationError) }
    it "does not raise error" do
      subject.setup_generation_from_file
      expect{subject.generation}.not_to raise_error
    end
  end

  context "#setup_generation_from_file" do
    it "raises error when file does not exist"do
      expect{subject.setup_generation_from_file("blah")}.to raise_error(FileError)
    end
    it "setups up correct generation" do
      subject.setup_generation_from_file
      expect(subject.generation.to_s).to eql data
    end
  end

  it "#setup_generation_from_raw_data sets up correctly" do
    cur_gen_data = "| . | . | . |\n| x | x | x |\n| . | . | . |\n"
    subject.setup_generation_from_raw_data(cur_gen_data)
    expect(subject.generation.to_s).to eql cur_gen_data
  end

  it "#setup_generation sets up correctly" do
    subject.setup_generation(array_2d)
    expect(subject.generation.to_s).to eql data
  end

  it "returns correct second generation" do
    next_generation_data = "| . | . | . |\n| . | . | . |\n| . | . | . |\n"
    subject.setup_generation_from_file
    expect(subject.next_generation.to_s).to eql next_generation_data
  end

  it "returns correct second generation" do
    cur_gen_data = "| . | . | . |\n| x | x | x |\n| . | . | . |\n"
    nex_gen_data = "| . | x | . |\n| . | x | . |\n| . | x | . |\n"
    subject.setup_generation_from_raw_data(cur_gen_data)
    expect(subject.next_generation.to_s).to eql nex_gen_data
  end
end

