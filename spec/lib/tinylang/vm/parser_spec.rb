require 'rspec'

require 'tinylang'

describe Tiny::Parser do
  it 'parses integer literals' do
    expect(subject.parse('123')).to eq(expressions(integer('123')))
    expect(subject.parse('  123  ')).to eq(expressions(integer('123')))
    expect { subject.parse('abc') }.to raise_error(Parslet::ParseFailed)
  end

  it 'parses method calls' do
    expect(subject.parse('2.method().other_method()')).to eq(expressions(method_call(integer('2'), 'method', 'other_method')))
  end

  it 'parses expression lists' do
    expect(subject.parse("123\n456")).to eq(expressions(integer('123'), integer('456')))
  end

  it 'parses assignments' do
    expect(subject.parse('x = 42')).to eq(expressions(assignment('x', integer('42'))))
  end

  private

  def expressions(*expressions)
    { expression_list: expressions }
  end

  def integer(integer)
    { integer: integer }
  end

  def method_call(object, *method_list)
    { method_call: { object: object, method_list: method_list.map { |method| { method: method }}}}
  end

  def assignment(variable, value)
    { assignment: { variable: variable, value: value }}
  end
end
