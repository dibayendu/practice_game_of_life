require 'spec_helper'

describe Cell do

  context "new living cell alive?" do
    it { expect(Cell.living.alive?).to be true }
  end

  context "new dead cell alive?" do
    it { expect(Cell.dead.alive?).to be false }
  end
end
