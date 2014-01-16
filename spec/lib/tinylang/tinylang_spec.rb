require 'rspec'

require 'tinylang'

describe Tiny do
  let(:parser) { Tiny::Parser.new }
  let(:transform) { Tiny::Transform.new }
  let(:compiler) { Tiny::Compiler.new(parser, transform) }

  it 'handles integers' do
    program = "x = 42\nx.double().inc().plus(5.times(3))\n"
    expect(compiler.compile(program).value).to eq(100)
  end

  it 'handles strings' do
    program = "\"hello\".concat(\", world!\")"
    expect(compiler.compile(program).value).to eq('hello, world!')
  end
end
