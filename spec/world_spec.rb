require 'spec_helper'

describe World do
  include_context 'positions'

  let(:col_count) { 3 }
  let(:data) do
    "| . | x | . |\n| . | . | . |\n| . | . | . |\n"
  end
  let(:world) do
    World.new({
      position_1 => dead_cell, position_2 => live_cell, position_3 => dead_cell,
      position_4 => dead_cell, position_5 => dead_cell, position_6 => dead_cell,
      position_7 => dead_cell, position_8 => dead_cell, position_9 => dead_cell,
    }, col_count)
  end

  subject { World.create(data) }

  it "creates correct world" do
    expect(subject.generation).to contain_exactly(*world.generation)
  end

  it "prints world" do
    expect(subject.to_s).to eql(data)
  end
end
