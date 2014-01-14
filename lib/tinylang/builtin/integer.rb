module Tiny
  class Integer
    attr_reader :value

    def initialize(value)
      @value = Integer(value)
    end

    def double
      Integer.new(2 * @value)
    end

    def inc
      Integer.new(1 + @value)
    end

    def times(other)
      Integer.new(@value * other.value)
    end

    def plus(other)
      Integer.new(@value + other.value)
    end

    def to_s
      @value.to_s
    end

    def eval(scope)
      self
    end
  end
end
