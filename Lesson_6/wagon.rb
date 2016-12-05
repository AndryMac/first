require_relative 'producer'
require_relative 'validator'

class Wagon
  include Producer
  include Validator

  TYPES_FORMAT = /^(passenger|cargo)$/

  attr_reader :type

  def initialize
    @type = type
    validate!
  end

  protected

  def validate!
    raise "NOT VALID TYPE!" if @type !~ TYPES_FORMAT
    true
  end

end