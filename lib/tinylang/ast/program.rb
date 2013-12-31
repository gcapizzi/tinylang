module Tiny
  class Program
    attr_reader :expressions

    def initialize(expressions)
      @expressions = expressions
    end

    def compile
      @expressions.map(&:compile).last
    end
  end
end
