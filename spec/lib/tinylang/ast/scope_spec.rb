require 'rspec'

require 'tinylang'

describe Tiny::Scope do
  it 'allows to set and get values by name' do
    subject.set('x', 42)
    expect(subject.get('x')).to eq(42)
  end
end
