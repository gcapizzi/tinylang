require 'rspec'

require 'tinylang'

describe Tiny::Assignment do
  let(:variable) { 'x' }
  let(:value) { double(:value) }
  let(:evaled_value) { Tiny::Integer.new(42) }
  let(:scope) { double(:scope) }

  subject { Tiny::Assignment.new(variable, value) }

  before { value.stub(:eval).with(scope).and_return(evaled_value) }

  it 'sets the variable value in the scope' do
    scope.should_receive(:set).with(variable, evaled_value)

    expect(subject.eval(scope)).to eq(evaled_value)
  end
end
