module Tiny
  class Variable
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def eval(scope)
      scope.get(name)
    end
  end
end
