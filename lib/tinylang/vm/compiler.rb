module Tiny
  class Compiler
    def initialize(parser, transform)
      @parser = parser
      @transform = transform
    end

    def compile(source)
      parse_tree = @parser.parse(source)
      ast = @transform.apply(parse_tree)
      ast.compile.to_s
    end
  end
end
