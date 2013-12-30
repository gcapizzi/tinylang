require 'rspec'

require 'tinylang'

describe Tiny do
  let(:parser) { Tiny::Parser.new }
  let(:transform) { Tiny::Transform.new }
  subject { Tiny::Compiler.new(parser, transform) }

  it 'runs a program' do
    program = "x = 42\n2.double().inc()"
    expect(subject.compile(program)).to eq('5')
  end
end
