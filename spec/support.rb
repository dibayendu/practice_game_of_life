require 'spec_helper'
require 'stringio'

shared_context "positions" do

  let(:position_1) { Position.new(0,0) }
  let(:position_2) { Position.new(0,1) }
  let(:position_3) { Position.new(0,2) }
  let(:position_4) { Position.new(1,0) }
  let(:position_5) { Position.new(1,1) }
  let(:position_6) { Position.new(1,2) }
  let(:position_7) { Position.new(2,0) }
  let(:position_8) { Position.new(2,1) }
  let(:position_9) { Position.new(2,2) }

  let(:dead_cell) { DeadCell.instance }
  let(:live_cell) { LiveCell.instance }

  let(:array_2d) { [[".", "x", "."], [".", ".", "."], [".", ".", "."]] }
  let(:data) { "| . | x | . |\n| . | . | . |\n| . | . | . |\n" }

  let(:current_grid) do
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
end

def capture_stdout(&blk)
  old = $stdout
  $stdout = fake = StringIO.new
  blk.call
  fake.string
ensure
  $stdout = old
end

def capture_stderr(&blk)
  old = $stderr
  $stderr = fake = StringIO.new
  blk.call
  fake.string
ensure
  $stderr = old
end
