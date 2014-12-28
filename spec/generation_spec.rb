require 'spec_helper'

describe Generation do
  include_context 'positions'

  let(:current) do
    {
      position_1 => dead_cell, position_2 => live_cell, position_3 => dead_cell,
      position_4 => dead_cell, position_5 => dead_cell, position_6 => dead_cell,
      position_7 => dead_cell, position_8 => dead_cell, position_9 => dead_cell,
    }
  end

  let(:next_world) do
    {
      position_1 => dead_cell, position_2 => dead_cell, position_3 => dead_cell,
      position_4 => dead_cell, position_5 => dead_cell, position_6 => dead_cell,
      position_7 => dead_cell, position_8 => dead_cell, position_9 => dead_cell,
    }
  end

  subject { Generation.create(array_2d) }

  it "#creat correct world" do
    expect(subject.world).to contain_exactly(*current)
  end

  it "#next world" do
    expect(subject.next.world).to contain_exactly(*next_world)
  end

  it "prints generation" do
    expect(subject.to_s).to eql(data)
  end
end
