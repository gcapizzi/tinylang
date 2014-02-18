require 'rspec'

require 'tinylang'

describe Tiny::Parser do
  it 'parses integer literals' do
    expect(subject.parse('  123  ')).to eq(program(int('123')))
  end

  it 'parses string literals' do
    expect(subject.parse('   "abc"   ')).to eq(program(str('abc')))
    expect { subject.parse('"abc"def"') }.to raise_error(Parslet::ParseFailed)
  end

  it 'parses method calls' do
    parsed_program = subject.parse('2.method(param1, param2).other_method()')
    expect(parsed_program).to eq(program(method_call(int('2'),
                                                     method('method', var('param1'), var('param2')),
                                                     method('other_method'))))

    expect(subject.parse('x.some_method()')).to eq(program(method_call(var('x'),
                                                                       method('some_method'))))
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

  it 'parses expressions in parentheses' do
    expect(subject.parse('(x = 5).to_string()')).to eq(program(method_call(assignment('x', int('5')),
                                                                           method('to_string'))))
  end

  private

  def program(*expressions)
    { program: expressions }
  end

  def int(integer)
    { integer: integer }
  end

  def str(string)
    { string: string }
  end

  def var(variable)
    { variable: variable }
  end

  def method_call(object, *methods)
    { method_call: { object: object, method_chain: methods } }
  end

  def assignment(variable, value)
    { assignment: { variable: variable, value: value } }
  end

  def method(method, *params)
    { method: method, params: params }
  end
end
