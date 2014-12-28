require 'singleton'

class LiveCell
  include Singleton

  CHARACTER = "x"

  def initialize
    @alive = true
    @alive.freeze
  end

  def alive?
    @alive
  end

  def next_generation(neighbours_count)
    neighbours_count > 1 && neighbours_count < 4 ? self : DeadCell.instance
  end
end

class DeadCell
  include Singleton

  CHARACTER = "."

  def initialize
    @alive = false
    @alive.freeze
  end

  def alive?
    @alive
  end

  def next_generation(neighbours_count)
    neighbours_count == 3 ? LiveCell.instance : DeadCell.instance
  end
end

