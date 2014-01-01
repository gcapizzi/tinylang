require 'rspec'

require 'tinylang/ast'

describe Tiny::MethodCall do
  it 'calls all the methods in sequence' do
    scope = double(:scope)

    object = double(:object)
    evaled_object = double(:evaled_object)
    object.stub(:eval).with(scope).and_return(evaled_object)

    method_chain = %w(one two three)
    method_call = Tiny::MethodCall.new(object, method_chain)

    evaled_object.stub_chain(*method_chain).and_return('result')
    expect(method_call.eval(scope)).to eq('result')
  end
end
