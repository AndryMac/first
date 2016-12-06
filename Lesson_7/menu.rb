class Menu

  TRAIN_TYPES = { 1 => PassengerTrain, 2 => CargoTrain }

  def initialize
    @stations = []
    @trains = []
    @wagons = []
  end


  def main_menu
    puts "Управление программой"
    help
  loop do

    puts "Укажите номер действия:"

    act = gets.chomp.to_i

    case act
      when 1
        help
      when 2
        create_station
      when 3
        show_stations
      when 4
        show_trains
      when 5
        create_train
      when 6
        add_wagon
      when 7
        del_wagon
      when 8
        take_train
      when 9
        show_all_stations_and_trains
      else
        puts "Программа завершена"
    end

    break if act == 0

  end
  end

  private
  

  def help
    puts "
        [0] - Выход из программы
        [1] - Получить справку
        ----------------------
        Станции:
        [2] - Создание станции
        [3] - Посмотреть список станций
        [4] - Посмотреть список поездов на станции
        ----------------------
        Поезда:
        [5] - Создать поезд
        [6] - Добавить вагон
        [7] - Отцепить вагон
        [8] - Поместить поезд на станцию
        [9] - Показать все поезда на станциях
   "
  end

  def create_station
    puts "Введите название станции"
    name = gets.chomp
    @stations << Station.new(name)
    rescue => e
    puts "Ошибка: #{e.message}"
    retry
  end

  def show_stations
      @stations.size.zero?
      puts "Вы станции еще не добавили"
      @stations.each_with_index { |station, i| puts "#{i + 1} - #{station.name}" }
  end

  def create_train
    puts "Укажите какой тип поезда создаем:"
    puts "
        [1] - пассажирский поезд
        [2] - грузовой поезд"
    puts "Укажите тип поезда"
    type = gets.chomp.to_i
    if TRAIN_TYPES.keys.include?(type)
      puts "Укажите номер поезда, формат (xxx-xx)"
      number = gets.chomp.to_s
      @trains << TRAIN_TYPES[type].new(number)
      puts "Поезд под номером #{number} был создан!"
    else
      puts "Указан не верный тип"
    end

    rescue => e
      puts "Ошибка: #{e.message}"
    retry
  end

  def add_wagon
    if @trains.last.type == :passenger
      puts "Укажите число мест в вагоне"
      empty_seats = gets.chomp.to_i
      @trains.last.add_wagon(PassengerWagon.new(empty_seats))
    else
      @trains.last.add_wagon(CargoWagon.new)
    end
  end

  def del_wagon
    @trains.last.del_wagon
  end

  def take_train
    puts "Укажите номер станции"
    number = gets.chomp.to_i
    @stations[number - 1].take_train(@trains.last)
  end

  def show_trains
    puts "Укажите номер станции, чтобы посмотреть на ней поезда"
    number = gets.chomp.to_i
    @stations[number - 1].show_all_trains
  end

  def show_all_stations_and_trains
    @stations.each {|station|
     puts "#{station.name}:"
     station.show_all_trains_block{|train| puts "#{train.show_train_info}"}}
  end


end