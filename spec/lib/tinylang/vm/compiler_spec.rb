require 'rspec'

require 'tinylang'

describe Tiny::Compiler do
  let(:parser) { double(Tiny::Parser) }
  let(:transform) { double(Tiny::Transform) }
  let(:parse_tree) { double(:parse_tree) }
  let(:ast) { double(:ast, eval: result) }
  let(:program) { 'some program' }
  let(:result) { double(:result, to_s: 'result') }

  subject { Tiny::Compiler.new(parser, transform) }

  before do
    parser.stub(:parse).with(program).and_return(parse_tree)
    transform.stub(:apply).with(parse_tree).and_return(ast)
  end

  it 'compiles a program' do
    expect(subject.compile(program)).to eq(result.to_s)
  end
end
