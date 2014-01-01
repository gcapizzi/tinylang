require 'rspec'

require 'tinylang'

describe Tiny::Variable do
  it 'evals to its value' do
    scope = double(:scope)
    value = Tiny::Integer.new(42)
    scope.stub(:get).with('x').and_return(value)
    variable = Tiny::Variable.new('x')
    expect(variable.eval(scope)).to eq(value)
  end
end
