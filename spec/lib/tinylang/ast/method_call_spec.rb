require 'rspec'

require 'tinylang/ast'

describe Tiny::MethodCall do
  it 'calls all the methods in sequence' do
    scope = double(:scope)

    object = double(:object)
    evaled_object = double(:evaled_object)
    object.stub(:eval).with(scope).and_return(evaled_object)

    first_method = double(:first_method)
    first_method.should_receive(:bind).with(evaled_object)
    first_method.stub(:eval).with(scope).and_return('first result')

    second_method = double(:second_method)
    second_method.should_receive(:bind).with('first result')
    second_method.stub(:eval).with(scope).and_return('second result')

    method_call = Tiny::MethodCall.new(object, [first_method, second_method])

    expect(method_call.eval(scope)).to eq('second result')
  end
end
