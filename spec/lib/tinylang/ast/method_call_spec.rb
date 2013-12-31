require 'rspec'

require 'tinylang/ast'

describe Tiny::MethodCall do
  it 'calls all the methods in sequence' do
    object = double(:object)
    method_chain = %w(one two three)
    method_call = Tiny::MethodCall.new(object, method_chain)

    object.stub_chain(*method_chain).and_return('result')
    expect(method_call.eval).to eq('result')
  end
end
