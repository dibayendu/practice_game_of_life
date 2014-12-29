require 'singleton'

class Cell
  private_class_method :new

  def alive?; @alive; end
  def to_s_grid; "| #{to_s} "; end
  def to_s; @character; end

  def self.create(character)
    character.casecmp(LiveCell::CHARACTER) == 0 ? LiveCell.instance : DeadCell.instance
  end
end

class LiveCell < Cell
  include Singleton

  CHARACTER = "x"

  def initialize
    @alive = true
    @character = CHARACTER
  end

  def next_generation(neighbours_count)
    neighbours_count > 1 && neighbours_count < 4 ? self : DeadCell.instance
  end
end

class DeadCell < Cell
  include Singleton

  CHARACTER = "."

  def initialize
    @alive = false
    @character = CHARACTER
  end

  def next_generation(neighbours_count)
    neighbours_count == 3 ? LiveCell.instance : DeadCell.instance
  end
end

