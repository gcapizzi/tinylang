module Tiny
  class Compiler
    def initialize(parser, transform)
      @parser = parser
      @transform = transform
    end

    def compile(source)
      parse_tree = @parser.parse(source)
      program = @transform.apply(parse_tree)
      scope = Scope.new
      program.eval(scope).to_string.to_s
    end
  end
end
