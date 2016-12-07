require_relative 'producer'
require_relative 'validator'

class Wagon
  include Producer
  include Validator

  TYPES = { cargo: 'Грузовой', passenger: 'Пассажирский' }.freeze
  TYPES_FORMAT = /^(passenger|cargo)$/

  attr_reader :type

  def initialize(type)
    @type = type
    validate!
  end

  def type_text
    TYPES[@type]
  end

  protected

  def validate!
    raise 'NOT VALID TYPE!' if @type !~ TYPES_FORMAT
  end
end
