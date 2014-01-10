module Tiny
  class MethodCall
    attr_reader :object, :method_chain

    def initialize(object, method_chain)
      @object = object
      @method_chain = method_chain
    end

    def eval(scope)
      target = object.eval(scope)
      method_chain.reduce(target) do |result, method|
        method.bind(result)
        method.eval(scope)
      end
    end
  end
end
