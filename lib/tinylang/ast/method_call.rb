module Tiny
  class MethodCall
    attr_reader :object, :method_list

    def initialize(object, method_list)
      @object = object
      @method_list = method_list
    end

    def compile
      method_list.reduce(object) do |result, method|
        result.send(method)
      end
    end
  end
end
