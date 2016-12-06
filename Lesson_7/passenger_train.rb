class PassengerTrain < Train
  def initialize(number)
    @type = :passenger
    super
  end
  def add_wagon(wagon)
    super if wagon.instance_of?(PassengerWagon)
  end
end

