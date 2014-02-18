require 'parslet'

module Tiny
  class Parser < Parslet::Parser
    # chars
    rule(:space) { match('\s').repeat(0) }
    rule(:dot) { str('.') }
    rule(:lparen) { str('(') }
    rule(:rparen) { str(')') }
    rule(:equal) { str('=') }
    rule(:quote) { str('"') }
    rule(:comma) { str(',') }

    # things
    rule(:integer) { match('[0-9]').repeat(1).as(:integer) >> space }
    rule(:identifier) { match('[a-zA-Z0-9_]').repeat(1) }
    rule(:variable) { identifier.as(:variable) >> space }
    rule(:string) { quote >> match('[^"]').repeat(0).as(:string) >> quote >> space }

    # grammar
    rule(:params) { (expression >> comma.maybe >> space).repeat(0).as(:params) >> space}
    rule(:method) { identifier.as(:method) >> lparen >> params >> rparen }
    rule(:method_chain) { (dot >> method).repeat(1).as(:method_chain) }

    rule(:atomic_value) { integer | string | variable }

    rule(:method_call) do
      (atomic_value.as(:object) >> method_chain).as(:method_call)
    end

    rule(:assignment) do
      (variable >> equal >> expression.as(:value)).as(:assignment) >> space
    end

    rule(:expression) do
      space >> (method_call | assignment | atomic_value)
    end

    rule(:program) { expression.repeat(0).as(:program) >> space }
    root(:program)
  end
end
