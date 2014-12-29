require 'spec_helper'

describe Generation do
  include_context 'positions'

  let(:next_population_grid) do
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

  let(:population) do
    OpenStruct.new(row_count: 3, col_count: 3, grid: current_grid)
  end

  subject { Generation.new(population) }

  it "#next population" do
    expect(subject.next.population.grid).to contain_exactly(*next_population_grid)
  end
end

