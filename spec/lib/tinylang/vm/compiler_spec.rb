require 'rspec'

require 'tinylang'

describe Tiny::Compiler do
  let(:parser) { double(Tiny::Parser) }
  let(:transform) { double(Tiny::Transform) }
  let(:parse_tree) { double(:parse_tree) }
  let(:ast) { double(:ast) }
  let(:program) { 'some program' }
  let(:result) { double(:result, to_string: double(:result, to_s: 'result')) }
  let(:scope) { double(Tiny::Scope) }

  subject { Tiny::Compiler.new(parser, transform) }

  before do
    Tiny::Scope.stub(:new).and_return(scope)

    parser.stub(:parse).with(program).and_return(parse_tree)
    transform.stub(:apply).with(parse_tree).and_return(ast)
    ast.stub(:eval).with(scope).and_return(result)
  end

  it 'compiles a program' do
    expect(subject.compile(program)).to eq('result')
  end
end
