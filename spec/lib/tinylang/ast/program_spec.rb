require 'rspec'

require 'tinylang/ast'

describe Tiny::Program do
  it 'evaluates all expressions, returns the return value of the last one' do
    expressions = %w(first second third).map do |name|
      expr_double = double("#{name}_expr")
      expr_double.should_receive(:compile).and_return(name)
      expr_double
    end
    program = Tiny::Program.new(expressions)

    expect(program.compile).to eq('third')
  end
end
