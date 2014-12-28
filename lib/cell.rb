require 'singleton'

class LiveCell
  include Singleton

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

  def initialize
    @alive = false
    @alive.freeze
  end

  def alive?
    @alive
  end
end

