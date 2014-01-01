module Tiny
  class Assignment
    attr_reader :variable, :value

    def initialize(variable, value)
      @variable = variable
      @value = value
    end

    def eval(scope)
      scope.set(variable, value)
      value
    end
  end
end
