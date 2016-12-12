module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validate(attr_name, type_name, option = nil)
      @options ||= []
      @options << {attr: attr_name, type: type_name, option: option }
      puts @options
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue
      false
    end


    def validate!
      temp_val = self.class
      until temp_val == Object
        if testing = temp_val.class_eval('@options')
          testing.each do |check|
            variable = instance_variable_get("@#{check[:attr]}")
            method = "#{check[:type]}_test"
            send method, variable, check[:option] if check[:option]
          end
        end
        temp_val = temp_val.superclass
      end
    end


  end

  private

  def presence_test(attr)
    raise "Пустое значение" if attr.nil? || attr.eql?('')
  end

  def format_test(attr, format)
    raise "Не верный формат" if attr !~ format
  end

  def type_test(attr, type)
    raise "Ошибка типа" if attr.is_a?(type) == false
  end

end

