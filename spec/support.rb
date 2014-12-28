require 'spec_helper'

shared_context "positions" do

  let(:position_1) { Position.new(0,0) }
  let(:position_2) { Position.new(1,0) }
  let(:position_3) { Position.new(2,0) }
  let(:position_4) { Position.new(0,1) }
  let(:position_5) { Position.new(1,1) }
  let(:position_6) { Position.new(2,1) }
  let(:position_7) { Position.new(0,2) }
  let(:position_8) { Position.new(1,2) }
  let(:position_9) { Position.new(2,2) }

  let(:dead_cell) { DeadCell.instance }
  let(:live_cell) { LiveCell.instance }
end
