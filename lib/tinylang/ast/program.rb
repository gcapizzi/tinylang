module Tiny
  class Program
    attr_reader :expressions

    def initialize(expressions)
      @expressions = expressions
    end

    def eval(scope)
      @expressions.map { |expression| expression.eval(scope) }.last
    end
  end
end
