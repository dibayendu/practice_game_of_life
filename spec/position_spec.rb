require 'spec_helper'

describe Position do
  include_context 'positions'

  let(:position) { Position.new(*coordinates) }
  let(:x_limit) { 3 }
  let(:y_limit) { 3 }
  let(:first_cell)  { OpenStruct.new(:cell => position_1,
                                     :neighbours => [position_2, position_4, position_5]) }
  let(:second_cell) { OpenStruct.new(:cell => position_2,
                                     :neighbours => [position_1, position_3, position_4,
                                                     position_5, position_6]) }
  let(:third_cell)  { OpenStruct.new(:cell => position_3,
                                     :neighbours => [position_2, position_5, position_6]) }
  let(:forth_cell)  { OpenStruct.new(:cell => position_4,
                                     :neighbours => [position_1, position_2, position_5,
                                                     position_7, position_8]) }
  let(:fifth_cell)  { OpenStruct.new(:cell => position_5,
                                     :neighbours => [position_1, position_2, position_3,
                                                     position_4, position_6,
                                                     position_7, position_8, position_9]) }
  let(:sixth_cell)  { OpenStruct.new(:cell => position_6,
                                     :neighbours => [position_2, position_3,
                                                     position_5, position_8, position_9]) }
  let(:seventh_cell)  { OpenStruct.new(:cell => position_7,
                                       :neighbours => [position_4, position_5, position_8]) }
  let(:eighth_cell)  { OpenStruct.new(:cell => position_8,
                                      :neighbours => [position_4, position_5, position_6,
                                                      position_7, position_9]) }
  let(:ninth_cell)  { OpenStruct.new(:cell => position_9,
                                     :neighbours => [position_5, position_6, position_8]) }
  let(:cells) { [first_cell, second_cell, third_cell, forth_cell, fifth_cell, sixth_cell,
                 seventh_cell, eighth_cell, ninth_cell] }


  context "#initialize" do
    let(:coordinates) { position_8.coordinates }
    it { expect(position.x).to eql 1 }
    it { expect(position.y).to eql 2 }
    it { expect(position.to_s).to eql "1,2" }
  end

  context "#neighbours" do
    (0..8).each do |i|
      it "cell #{(i+1).to_s} has correct neighbours" do
        neighbours = Position.new(*cells[i].cell.coordinates).neighbours(x_limit, y_limit)
        expect(neighbours).to contain_exactly(*cells[i].neighbours)
      end
    end
  end

  context "#comparer" do
    let(:coordinates)     { position_5.coordinates }
    let(:lower_positions) { [position_1, position_2, position_3, position_4] }
    let(:higher_positions) { [position_6, position_7, position_8, position_9] }

    it { expect(position == Position.new(1,1)).to be true  }

    (0..3).each do |i|
      it "postion_#{i+1} is lower than position_5" do
        expect(lower_positions[i] < position).to be true
      end
    end
    (0..3).each do |i|
      it "postion_#{i+6} is higher than position_5" do
        expect(higher_positions[i] > position).to be true
      end
    end
  end
end

