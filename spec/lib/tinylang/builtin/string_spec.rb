require 'rspec'

require 'tinylang'

describe Tiny::String do
  subject { Tiny::String.new('foo') }

  it 'holds a value' do
    expect(subject.value).to eq('foo')
  end

  it 'evals to itself' do
    expect(subject.eval(nil)).to eq(subject)
  end

  describe '#length' do
    it 'returns the string length as a Tiny::Integer' do
      length = subject.length

      expect(length).to be_a(Tiny::Integer)
      expect(length.value).to eq(3)
    end
  end

  describe '#concat' do
    it 'concatenates it with another string' do
      expect(subject.concat(Tiny::String.new('bar')).value).to eq('foobar')
    end
  end

  describe '#to_string' do
    it 'returns itself' do
      expect(subject.to_string).to eq(subject)
    end
  end

  describe '#to_s' do
    it 'returns the value' do
      expect(subject.to_s).to eq('foo')
    end
  end
end
