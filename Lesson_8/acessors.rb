module Acessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        @meaning ||={}
        @meaning[name] ||=[]
        @meaning[name] << value
      end
      define_method("#{name}_history") { @meaning[name] if @meaning.size > 0}
    end
  end


  def strong_attr_acessor(name, class_name)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      raise 'Не верный тим' unless value.is_a?(class_name)
      instance_variable_set(var_name, value)
    end
  end

end

class Test
  extend Acessors

  attr_accessor_with_history :a, :b, :c
end

test = Test.new
test.a = 5
test.a = 7
test.a = 9
puts test.a_history.inspect
puts test.b_history.inspect


