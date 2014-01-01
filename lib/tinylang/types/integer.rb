module Tiny
  class Integer
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def double
      Integer.new(2 * @value)
    end

    def inc
      Integer.new(1 + @value)
    end

    def to_s
      @value.to_s
    end

    def eval
      self
    end
  end
end
