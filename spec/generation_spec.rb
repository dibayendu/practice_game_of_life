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

  let(:next_population) do
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

  it "#initialize generation, population is empty" do
    expect(Generation.new(3, 3).population).to eql([[{}, {}, {}], [{}, {}, {}], [{}, {}, {}]])
  end

  it "#center_cell is dead" do
    expect(subject.center_cell.alive?).to be false
  end

  it "#create correct population" do
    expect(subject.population).to contain_exactly(*current)
  end

  it "#next population" do
    expect(subject.next.population).to contain_exactly(*next_population)
  end

  it "prints generation" do
    expect(subject.to_s).to eql(data)
  end
end

