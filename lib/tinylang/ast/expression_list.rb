module Tiny
  class ExpressionList
    attr_reader :expressions

    def initialize(expressions)
      @expressions = expressions
    end

    def compile
      @expressions.map(&:compile).last
    end
  end
end
