require 'rspec'

require 'tinylang/ast'

describe Tiny::MethodCall do
  it 'calls all the methods in sequence' do
    object = double(:object)
    method_list = ['one', 'two', 'three']
    method_call = Tiny::MethodCall.new(object, method_list)
    result = double(:result, compile: 'result')

    object.stub_chain(*method_list).and_return(result)
    expect(method_call.compile).to eq('result')
  end
end
