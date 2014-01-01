module Tiny
  class Scope
    def initialize
      @values = {}
    end

    def get(name)
      @values[name]
    end

    def set(name, value)
      @values[name] = value
    end

    def to_s
      @values.inspect
    end
  end
end
