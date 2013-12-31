require 'rspec'

require 'tinylang'

describe Tiny::Parser do
  it 'parses integer literals' do
    expect(subject.parse('  123  ')).to eq(program(integer('123')))
  end

  it 'parses method calls' do
    parsed_method_call = subject.parse('2.method().other_method()')
    expect(parsed_method_call).to eq(program(method_call(integer('2'), 'method', 'other_method')))

    expect(subject.parse('x.some_method()')).to eq(program(method_call(variable('x'), 'some_method')))
  end

  it 'parses expression lists' do
    expect(subject.parse("123\n456")).to eq(program(integer('123'), integer('456')))
  end

  it 'parses assignments' do
    expect(subject.parse('x = 42')).to eq(program(assignment('x', integer('42'))))
  end

  it 'parses variables' do
    expect(subject.parse('   x   ')).to eq(program(variable('x')))
  end

  private

  def program(*expressions)
    { program: expressions }
  end

  def integer(integer)
    { integer: integer }
  end

  def variable(variable)
    { variable: variable }
  end

  def method_call(object, *method_chain)
    { method_call: { object: object, method_chain: method_chain.map { |method| { method: method } } } }
  end

  def assignment(variable, value)
    { assignment: { variable: variable, value: value } }
  end
end
