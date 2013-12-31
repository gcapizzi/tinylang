require 'parslet'

require 'tinylang/ast'
require 'tinylang/types'

module Tiny
  class Transform < Parslet::Transform
    rule(method: simple(:method)) { method }

    rule(method_call: { object: simple(:object), method_list: sequence(:method_list) }) do
      MethodCall.new(object, method_list)
    end

    rule(expression_list: sequence(:expressions)) do
      ExpressionList.new(expressions)
    end

    rule(assignment: subtree(:assignment)) do
      Assignment.new(assignment[:variable], assignment[:value])
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
