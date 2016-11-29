class Menu

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
        create_train
      when 5
        add_wagon
      when 6
        del_wagon
      when 8
        show_trains
      when 15
        take_train
      when 100
        show_stations2

      when 11
        show_wagons
      when 99
        show_trains2

      else
        puts "Программа завершена"
    end

    break if act == 0

  end
  end



  def help
    puts "
        [0] - Выход из программы
        [1] - Получить справку
        ----------------------
        Станции:
        [2] - Создание станции
        [3] - Посмотреть список станций
        ----------------------
        Поезда:
        [4] - Создать поезд
        [5] - Добавить вагон
        [6] - Убрать вагон
        [15] - Поместить поезд на станцию
        [7] - Добавить маршрут поезду
        [8] - Посмотреть список поездов
        [9] - Отправить поезд
        ----------------------
        Вагоны:
        [10] -  Создать вагон
        [11] - Список вагонов
        ----------------------
        Маршруты:
        [12] - Создать маршрут
        [13] - Добавить станцию к маршруту
        [14] - Посмотрть список станций
        ----------------------
   "
  end

  def create_station
    puts "Введите название станции"
    name = gets.chomp
    @stations << Station.new(name)
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
    type = gets.chomp.to_i
    if type == 1
      puts "Укажите номер поезда"
      number = gets.chomp.to_i
      @trains << PassengerTrain.new(number)
    elsif type == 2
      puts "Укажите номер поезда"
      number = gets.chomp.to_i
      @trains << CargoTrain.new(number)
    else
      puts "Вы указали не правильное значение"
    end
  end


  def add_wagon
    if @trains.last.type == :passenger
      @trains.last.add_wagon(PassengerWagon.new)
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



  def show_trains2
    p @trains
  end
  def show_stations2

   p @stations
  end

end