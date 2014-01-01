require 'rspec'

require 'tinylang'

describe Tiny::Assignment do
  let(:variable) { 'x' }
  let(:value) { 42 }
  subject { Tiny::Assignment.new(variable, value) }

  it 'sets the variable value in the scope' do
    scope = double(:scope)
    scope.should_receive(:set).with(variable, value)

    expect(subject.eval(scope)).to eq(value)
  end
end
