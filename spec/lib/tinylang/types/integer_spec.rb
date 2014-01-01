require 'rspec'

require 'tinylang'

describe Tiny::Integer do
  subject { Tiny::Integer.new(42) }

  it 'holds a value' do
    expect(subject.value).to eq(42)
  end

  it 'evals to itself' do
    expect(subject.eval).to eq(subject)
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

  describe '#to_s' do
    it 'returns the value converted to a string' do
      expect(subject.to_s).to eq('42')
    end
  end
end
