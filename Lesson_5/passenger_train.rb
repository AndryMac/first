class PassengerTrain < Train
  def initialize(name)
    @type = :passenger
    super
  end
  def add_wagon(wagon)
    super if wagon.instance_of?(PassengerWagon)
  end
end