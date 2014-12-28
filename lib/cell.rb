class Cell
  private_class_method :new
  attr_reader :alive

  def alive?
    alive
  end

  class << self
    def living
      Cell.send(:new, true)
    end

    def dead
      Cell.send(:new, false)
    end
  end

  private
    def initialize(alive)
      @alive = alive
      @alive.freeze
    end
end
