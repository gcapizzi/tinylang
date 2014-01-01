require 'parslet'

module Tiny
  class Parser < Parslet::Parser
    # chars
    rule(:space) { match('\s').repeat(0) }
    rule(:dot) { str('.') }
    rule(:lparen) { str('(') }
    rule(:rparen) { str(')') }
    rule(:equal) { str('=') }

    # things
    rule(:integer) { match('[0-9]').repeat(1).as(:integer) >> space }
    rule(:identifier) { match('[a-z_]').repeat(1) }
    rule(:variable) { identifier.as(:variable) >> space }

    # grammar
    rule(:method) { identifier.as(:method) >> lparen >> rparen }
    rule(:method_chain) { (dot >> method).repeat(1).as(:method_chain) }

    rule(:method_call) do
      ((integer | variable).as(:object) >> method_chain).as(:method_call)
    end

    rule(:assignment) do
      (variable >> equal >> expression.as(:value)).as(:assignment) >> space
    end

    rule(:expression) do
      space >> (method_call | integer | assignment | variable)
    end

    rule(:program) { expression.repeat(0).as(:program) >> space }
    root(:program)
  end
end
