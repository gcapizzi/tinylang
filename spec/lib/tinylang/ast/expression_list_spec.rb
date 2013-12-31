require 'rspec'

require 'tinylang/ast'

describe Tiny::ExpressionList do
  it 'evaluates all expressions, returns the return value of the last one' do
    expressions = %w(first second third).map do |name|
      expr_double = double("#{name}_expr")
      expr_double.should_receive(:compile).and_return(name)
      expr_double
    end
    expression_list = Tiny::ExpressionList.new(expressions)

    expect(expression_list.compile).to eq('third')
  end
end
