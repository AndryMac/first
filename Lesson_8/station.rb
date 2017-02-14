require_relative 'validator'

class Station
  include Validation

  STATION_FORMAT = /\w+/i

  attr_accessor :name

  @@station = []

  def initialize(name)
    @name = name
    @list_trains = []
    @@station << self
    validate!
  end

  def validate!
    raise 'Не верно указано навзание станции' if @name !~ STATION_FORMAT
  end

  def take_train(train)
    @list_trains.push(train)
  end

  def show_all_trains
    @list_trains.each do |train|
      puts "Поезд № #{train.number} - #{train.type_text}"
      train.show_wagons_block do |wagon, num|
        num += 1
        if wagon.type == :passenger
          puts "Вагон №#{num}: #{wagon.type_text} #{wagon.show_empty_seats} #{wagon.show_occupied_seats} "
        else
          puts "Вагон №#{num}: #{wagon.type_text} #{wagon.show_load_capacity} #{wagon.show_free_capacity} "
        end
      end
      puts
    end
    puts 'На станции нет поездов' if @list_trains.empty?
  end

  def each_train
    @list_trains.each { |train| yield(train) }
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
