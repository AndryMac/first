require_relative 'validator'

class Station

  STATION_FORMAT = /\w+/i

  attr_accessor :name

  @@station = []

  def initialize(name)
    @name =  name
    @list_trains = []
    @@station << self
    validate!
  end

  def validate!
    raise "Не верно указано навзание станции" if @name !~ STATION_FORMAT
    true
  end

  def take_train(train)
    @list_trains.push(train)
  end

  def show_all_trains
    @list_trains.each do |train|
      puts "Поезд № #{train.number} - #{train.type_text}"
    end

    puts "На станции нет поездов"   if @list_trains.size == 0
  end

  def show_type_trains
    cargo_trains = @list_trains.select { |train| train.type == :cargo }.size
    passenger_trains = @list_trains.select { |train| train.type == :passenger }.size
    puts "На станции #{@name}: #{passenger_trains} - пассажирских поезда и #{cargo_trains} - грузовых "
  end

  def remove_train(train)
    @list_trains.delete(train)
  end

  def self.all
    @@station
  end

end
