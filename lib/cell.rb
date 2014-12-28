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
end

