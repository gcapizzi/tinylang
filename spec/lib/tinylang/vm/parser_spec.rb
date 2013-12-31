require 'rspec'

require 'tinylang'

describe Tiny::Parser do
  it 'parses integer literals' do
    expect(subject.parse('  123  ')).to eq(program(int('123')))
  end

  it 'parses method calls' do
    parsed_program = subject.parse('2.method().other_method()')
    expect(parsed_program).to eq(program(method_call(int('2'), 'method', 'other_method')))

    expect(subject.parse('x.some_method()')).to eq(program(method_call(var('x'), 'some_method')))
  end

  it 'parses multi-line programs' do
    expect(subject.parse("123\n456")).to eq(program(int('123'), int('456')))
  end

  it 'parses assignments' do
    expect(subject.parse('x = 42')).to eq(program(assignment('x', int('42'))))
  end

  it 'parses variables' do
    expect(subject.parse('   x   ')).to eq(program(var('x')))
  end

  private

  def program(*expressions)
    { program: expressions }
  end

  def int(integer)
    { integer: integer }
  end

  def var(variable)
    { variable: variable }
  end

  def method_chain(methods)
    methods.map { |method| { method: method } }
  end

  def method_call(object, *methods)
    { method_call: { object: object, method_chain: method_chain(methods) } }
  end

  def assignment(variable, value)
    { assignment: { variable: variable, value: value } }
  end
end
