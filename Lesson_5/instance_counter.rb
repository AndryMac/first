module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    def instances
      self.count
    end

    protected
    attr_accessor :count

    def add
      self.count = 0 if self.count == nil
      self.count += 1
    end
  end

  module InstanceMethods
    private
    def register_instance
      self.class.send(:add)
    end
  end
end



