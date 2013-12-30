require 'parslet'

require 'tinylang/ast'
require 'tinylang/types'

module Tiny
  class Transform < Parslet::Transform
    rule(method_call: { object: simple(:object), method: simple(:method) }) do
      MethodCall.new(object, method)
    end

    rule(expression_list: sequence(:expressions)) do
      ExpressionList.new(expressions)
    end

    rule(assignment: subtree(:assignment)) do
      Assignment.new(assignment[:variable], assignment[:value])
    end

    # literals

    rule(integer: simple(:x)) do
      Integer.new(Integer(x))
    end
  end
end
