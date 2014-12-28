require 'spec_helper'

describe LiveCell do
  context "live cell alive?" do
    it { expect(LiveCell.instance.alive?).to be true }
  end
end

describe DeadCell do
  context "dead cell alive?" do
    it { expect(DeadCell.instance.alive?).to be false }
  end
end

