require 'spec_helper'

describe Generation do
  include_context 'positions'

  let(:current) do
    [
      [
        {:position => position_1, :cell => dead_cell},
        {:position => position_2, :cell => live_cell},
        {:position => position_3, :cell => dead_cell}
      ],
      [
        {:position => position_4, :cell => dead_cell},
        {:position => position_5, :cell => dead_cell},
        {:position => position_6, :cell => dead_cell}
      ],
      [
        {:position => position_7, :cell => dead_cell},
        {:position => position_8, :cell => dead_cell},
        {:position => position_9, :cell => dead_cell}
      ]
    ]
  end

  let(:next_world) do
    [
      [
        {:position => position_1, :cell => dead_cell},
        {:position => position_2, :cell => dead_cell},
        {:position => position_3, :cell => dead_cell}
      ],
      [
        {:position => position_4, :cell => dead_cell},
        {:position => position_5, :cell => dead_cell},
        {:position => position_6, :cell => dead_cell}
      ],
      [
        {:position => position_7, :cell => dead_cell},
        {:position => position_8, :cell => dead_cell},
        {:position => position_9, :cell => dead_cell}
      ]
    ]
  end

  subject { Generation.create(array_2d) }

  it "#initialize generation, world is empty" do
    expect(Generation.new(3, 3).world).to eql([[{}, {}, {}], [{}, {}, {}], [{}, {}, {}]])
  end

  it "#center_cell is dead" do
    expect(subject.center_cell.alive?).to be false
  end

  it "#create correct world" do
    expect(subject.world).to contain_exactly(*current)
  end

  it "#next world" do
    expect(subject.next.world).to contain_exactly(*next_world)
  end

  it "prints generation" do
    expect(subject.to_s).to eql(data)
  end
end

