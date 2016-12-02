require_relative 'producer'
class Wagon
  include Producer

  attr_reader :type

  def initialize
    @type = type
  end
end