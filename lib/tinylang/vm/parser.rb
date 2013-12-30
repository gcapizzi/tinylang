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
    rule(:identifier) { match('[a-z]').repeat(1) }
    rule(:variable) { identifier.as(:variable) >> space }

    # grammar
    rule(:method_call) { (integer.as(:object) >> dot >> identifier.as(:method) >>
                          lparen >> rparen).as(:method_call) }
    rule(:assignment) { (variable >> equal >> expression.as(:value)).as(:assignment) >> space }

    rule(:expression) { space >> (method_call | integer | assignment) }
    rule(:expression_list) { expression.repeat(0).as(:expression_list) }
    root(:expression_list)
  end
end
