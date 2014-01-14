require 'rspec'

require 'tinylang'

describe Tiny::Integer do
  subject { Tiny::Integer.new(42) }

  it 'holds a value' do
    expect(subject.value).to eq(42)
  end

  it 'evals to itself' do
    expect(subject.eval(nil)).to eq(subject)
  end

  describe '#double' do
    it 'doubles the number' do
      expect(subject.double.value).to eq(84)
    end
  end

  describe '#inc' do
    it 'increments the number' do
      expect(subject.inc.value).to eq(43)
    end
  end

  describe '#plus' do
    it 'adds an integer' do
      expect(subject.plus(Tiny::Integer.new(3)).value).to eq(45)
    end
  end

  describe '#times' do
    it 'multiplies by an integer' do
      expect(subject.times(Tiny::Integer.new(2)).value).to eq(84)
    end
  end

  describe '#to_string' do
    it 'returns the value converted to a Tiny::String' do
      string = subject.to_string

      expect(string).to be_a(Tiny::String)
      expect(string.value).to eq('42')
    end
  end
end
