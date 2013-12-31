module Tiny
  class MethodCall
    attr_reader :object, :method_chain

    def initialize(object, method_chain)
      @object = object
      @method_chain = method_chain
    end

    def compile
      method_chain.reduce(object) do |result, method|
        result.send(method)
      end
    end
  end
end
