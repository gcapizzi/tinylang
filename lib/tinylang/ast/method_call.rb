module Tiny
  class MethodCall
    attr_reader :object, :method

    def initialize(object, method)
      @object = object
      @method = method
    end

    def compile
      object.send(method).compile
    end
  end
end
