module Tiny
  class String
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def length
      @value.length
    end
  end
end
