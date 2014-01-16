module Tiny
  class String < Object
    attr_reader :value

    def initialize(value)
      @value = String(value)
    end

    def length
      Integer.new(@value.length)
    end

    def concat(other)
      String.new(@value + other.value)
    end

    def to_string
      self
    end

    def to_s
      @value
    end

    def eval(scope)
      self
    end
  end
end
