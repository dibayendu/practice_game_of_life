require 'spec_helper'

describe Cell do
  it "#new raises error" do
    expect{Cell.new}.to raise_error(NoMethodError)
  end

  context "#create" do
    it { expect(Cell.create(LiveCell::CHARACTER)).to be_a LiveCell }
    it { expect(Cell.create(DeadCell::CHARACTER)).to be_a DeadCell }
    it { expect(Cell.create("undefined")).to be_a DeadCell }
  end
end

describe LiveCell do
  let(:live_cell) { LiveCell.instance }
  context "live cell alive?" do
    it { expect(live_cell.alive?).to be true }
  end

  context "#next_generation" do
    it { expect(live_cell.next_generation(1)).to be_a DeadCell }
    it { expect(live_cell.next_generation(2)).to be_a LiveCell }
    it { expect(live_cell.next_generation(3)).to be_a LiveCell }
    it { expect(live_cell.next_generation(4)).to be_a DeadCell }
  end

  it "#to_s gives character for live cell" do
    expect(live_cell.to_s).to eql(LiveCell::CHARACTER)
  end
end

describe DeadCell do
  let(:dead_cell) { DeadCell.instance }
  context "dead cell alive?" do
    it { expect(dead_cell.alive?).to be false }
  end

  context "#next_generation" do
    it { expect(dead_cell.next_generation(1)).to be_a DeadCell }
    it { expect(dead_cell.next_generation(2)).to be_a DeadCell }
    it { expect(dead_cell.next_generation(3)).to be_a LiveCell }
    it { expect(dead_cell.next_generation(4)).to be_a DeadCell }
  end

  it "#to_s gives character for dead cell" do
    expect(dead_cell.to_s).to eql(DeadCell::CHARACTER)
  end
end

