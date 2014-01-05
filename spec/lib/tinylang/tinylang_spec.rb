require 'rspec'

require 'tinylang'

describe Tiny do
  let(:parser) { Tiny::Parser.new }
  let(:transform) { Tiny::Transform.new }
  let(:compiler) { Tiny::Compiler.new(parser, transform) }

  it 'handles integers' do
    program = "x = 42\nx.double().inc()\n"
    expect(compiler.compile(program)).to eq('85')
  end

  it 'handles strings' do
    program = "x = \"hello, world!\"\nx.length()"
    expect(compiler.compile(program)).to eq('13')
  end
end
