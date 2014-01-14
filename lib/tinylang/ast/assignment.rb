module Tiny
  class Assignment
    attr_reader :variable, :value

    def initialize(variable, value)
      @variable = variable
      @value = value
    end

    def eval(scope)
      evaled_value = value.eval(scope)
      scope.set(variable, evaled_value)
      evaled_value
    end
  end
end
