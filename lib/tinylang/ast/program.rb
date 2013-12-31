module Tiny
  class Program
    attr_reader :expressions

    def initialize(expressions)
      @expressions = expressions
    end

    def eval
      @expressions.map(&:eval).last
    end
  end
end
