require 'rspec'

require 'tinylang'

describe Tiny::Method do
  it 'calls the method on the binded object' do
    scope = double(:scope)

    first_param = double(:first_param)
    first_param.stub(:eval).with(scope).and_return('first param')

    second_param = double(:second_param)
    second_param.stub(:eval).with(scope).and_return('second param')

    method = Tiny::Method.new('some_method', [first_param, second_param])

    object = double(:object)
    object.should_receive(:send).with('some_method', 'first param', 'second param').and_return('result')

    method.bind(object)
    expect(method.eval(scope)).to eq('result')
  end
end
