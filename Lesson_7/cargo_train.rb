
class CargoTrain < Train
  def initialize(number)
    @type = :cargo
    super
  end
  def add_wagon(wagon)
    super if wagon.instance_of?(CargoWagon)
  end
end