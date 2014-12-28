require 'spec_helper'

describe World do
  include_context 'positions'

  let(:generation) do
    {
      position_1 => dead_cell, position_2 => live_cell, position_3 => dead_cell,
      position_4 => dead_cell, position_5 => dead_cell, position_6 => dead_cell,
      position_7 => dead_cell, position_8 => dead_cell, position_9 => dead_cell,
    }
  end

  subject { World.create(array_2d) }

  it "creates correct world" do
    expect(subject.generation).to contain_exactly(*generation)
  end

  it "prints world" do
    expect(subject.to_s).to eql(data)
  end
end
