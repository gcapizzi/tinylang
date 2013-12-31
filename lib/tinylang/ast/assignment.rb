module Tiny
  class Assignment
    attr_reader :variable, :value

    def initialize(variable, value)
      @variable = variable
      @value = value
    end

    alias_method :eval, :value
  end
end
