require 'parslet'

require 'tinylang/ast'
require 'tinylang/types'

module Tiny
  class Transform < Parslet::Transform
    rule(method: simple(:method)) { method }

    rule(method_call: { object: simple(:object),
                        method_chain: sequence(:method_chain) }) do
      MethodCall.new(object, method_chain)
    end

    rule(program: sequence(:expressions)) do
      Program.new(expressions)
    end

    rule(assignment: { variable: simple(:variable),
                       value: simple(:value) }) do
      Assignment.new(variable, value)
    end

    rule(variable: simple(:variable)) do
      Variable.new(variable)
    end

    # literals

    rule(integer: simple(:x)) do
      Integer.new(Integer(x))
    end
  end
end
