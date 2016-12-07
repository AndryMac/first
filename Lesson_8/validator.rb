module Validator
  def valid?
    validate!
    true
  rescue
    false
  end
end
