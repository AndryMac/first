module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def instances
      @count
    end

    protected

    attr_accessor :count

    def add
      @count ||= 0
      @count += 1
    end
  end

  module InstanceMethods
    private

    def register_instance
      self.class.send(:add)
    end
  end
end
