require 'population'

describe Population do
  include_context 'positions'

  subject { Population.create(array_2d) }

  it "creates expected grid" do
    expect(subject.grid).to contain_exactly(*current_grid)
  end

  it "#initialize generation, population is empty" do
    expect(Population.new(3, 3).grid).to eql([[{}, {}, {}], [{}, {}, {}], [{}, {}, {}]])
  end

  it "#center_cell is dead" do
    expect(subject.center_cell.alive?).to be false
  end

  it "prints generation" do
    expect(subject.to_s).to eql(data)
  end
end

