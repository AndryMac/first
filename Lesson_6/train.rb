
require_relative 'producer'
require_relative 'instance_counter'
require_relative 'validator'


class Train
  include Producer
  include InstanceCounter
  include Validator


  TYPES = { cargo: 'Грузовой', passenger: 'Пассажирский' }
  NUMBER_FORMAT = /^(\w{3}|\d{3})(-)?(\w{2}|\d{2})$/
  TYPES_FORMAT = /^(passenger|cargo)$/

  attr_accessor :number, :type, :wagons, :speed, :set_route
  attr_writer :curent_station, :next_station, :prev_station

  @@trains = []



  def initialize(number, speed = 0)
    @number = number
    @wagons = []
    @speed = speed
    @@trains << self
    register_instance
    validate!
  end

  def validate!
    raise "Не верно задан номер поезда" if @number !~ NUMBER_FORMAT
    raise "Не указан тип поезда" if @type !~ TYPES_FORMAT
    true
  end


  def self.find(number)
    @@trains.select{|train| train.number == number}
  end

  def type_text
    TYPES[@type]
  end

  def show_speed
    puts "Текущая скорость поезда №#{number} - #{@speed}"
  end

  def change_speed(speed)
    @speed = speed
    puts "Скорость поезда №#{number} увеличина до #{@speed}"
  end

  def down_speed
    @speed = 0
    puts "Скорость поезда №#{number} снижена до #{@speed}"
  end


  def add_wagon(wagon)
    if @speed == 0
      @wagons << wagon
      puts "К поезду №#{number} добавлени 1 вагон"
    else
      puts "Пока поезд в движении вагоны добавить нельзя"
    end
  end

  def del_wagon
    if @speed == 0 && @wagons.size > 0

      @wagons.delete_at(-1)
      puts "От поезда №#{number} отцеплен 1 вагон"
    elsif @wagons.size == 0
      puts "У состава №#{number} вагонов нет"
    else
      puts "Пока поезд в движении вагон отцепить нельзя"
    end
  end

  def set_route(route)
    @route = route.list_stations
    @curent_station = @route.first
  end


  def next_station
    if @curent_station == @route.last
      "Станция #{@curent_station} конечная"
    else
      @next_index = @route.index(@curent_station).next
      "Следующая станция #{@route.fetch(@next_index)}"

    end
  end

  def show_next_station
    puts next_station
  end

  def move_next_station
    @curent_station = @route.fetch(@next_index)
  end

  def prev_station
    if @curent_station == @route.first
      "Станция #{@curent_station} начальная"
    else
      @pred_index = @route.index(@curent_station).pred
      "Предыдущая станция #{@route.fetch(@pred_index)}"
    end

  end

  def show_prev_station
    puts prev_station
  end

  def move_prev_station
    @curent_station = @route.fetch(@pred_index)
  end

end
