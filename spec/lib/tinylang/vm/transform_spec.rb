require 'rspec'

require 'tinylang'

describe Tiny::Transform do
  it 'transforms integer literals' do
    integer = subject.apply(integer: '123')

    expect(integer).to be_a(Tiny::Integer)
    expect(integer.value).to eq(123)
  end

  it 'transforms string literals' do
    string = subject.apply(string: 'abc')

    expect(string).to be_a(Tiny::String)
    expect(string.value).to eq('abc')
  end

  it 'transforms method calls' do
    method_call = subject.apply(method_call: { object: { integer: '123' }, method_chain: ['double'] })

    expect(method_call).to be_a(Tiny::MethodCall)
    expect(method_call.object).to be_a(Tiny::Integer)
    expect(method_call.method_chain).to eq(['double'])
  end

  it 'transforms expression lists' do
    program = subject.apply(program: [{ integer: '123' }, { integer: '456' }])

    expect(program).to be_a(Tiny::Program)
    expect(program.expressions.count).to eq(2)
  end

  it 'transforms assignments' do
    assignment = subject.apply(assignment: { variable: 'x', value: { integer: '42' } })

    expect(assignment).to be_a(Tiny::Assignment)
    expect(assignment.variable).to eq('x')
    expect(assignment.value.value).to eq(42)
  end

  it 'transforms variables' do
    variable = subject.apply(variable: 'x')

    expect(variable).to be_a(Tiny::Variable)
    expect(variable.name).to eq('x')
  end
end
