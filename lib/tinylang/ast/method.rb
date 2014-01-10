module Tiny
  class Method
    attr_reader :params

    def initialize(method_name, params)
      @method_name = method_name
      @params = params
    end

    def bind(object)
      @object = object
    end

    def eval(scope)
      evaled_params = @params.map { |param| param.eval(scope) }
      @object.send(@method_name, *evaled_params)
    end
  end
end
