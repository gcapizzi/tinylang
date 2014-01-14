module Tiny
  class String
    attr_reader :value

    def initialize(value)
      @value = String(value)
    end

    def length
      @value.length
    end
  end
end
