require 'parslet'

require 'tinylang/ast'
require 'tinylang/builtin'

module Tiny
  class Transform < Parslet::Transform
    rule(method: simple(:method), params: sequence(:params)) do
      Method.new(String(method), params)
    end

    rule(method_call: { object: simple(:object), method_chain: sequence(:method_chain) }) do
      MethodCall.new(object, method_chain)
    end

    rule(program: sequence(:expressions)) do
      Program.new(expressions)
    end

    rule(assignment: { variable: simple(:variable), value: simple(:value) }) do
      Assignment.new(String(variable), value)
    end

    rule(variable: simple(:variable)) do
      Variable.new(String(variable))
    end

    # literals

    rule(integer: simple(:x)) { Integer.new(x) }
    rule(string: simple(:x)) { String.new(x) }
  end
end
