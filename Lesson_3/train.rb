class Train

  TYPES = { cargo: 'Грузовой', passenger: 'Пассажирский' }

  attr_accessor :number, :type, :wagons, :speed, :set_route, :curent_station, :next_station, :prev_station

  def initialize(number, type, wagons = 2, speed = 0)
    @number = number
    @type = type
    @wagons = wagons
    @speed = speed
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

  def show_wagons_count
    puts "У поезда №#{number} количество вагонов: #{@wagons} шт."
  end

  def add_wagon
    if @speed == 0
      @wagons +=1
      puts "К поезду №#{number} добавлени 1 вагон"
    else puts "Пока поезд в движении вагоны добавить нельзя"
    end
  end

  def del_wagon
    if @speed == 0 && @wagons > 0
      @wagons -=1
      puts "От поезда №#{number} отцеплен 1 вагон"
    elsif @wagons == 0
      puts "У состава №#{number} вагонов нет"
    else puts "Пока поезд в движении вагон отцепить нельзя"
    end
  end

  def set_route(route)
    @set_route = route
    @curent_station = @set_route.first_station
  end

  def curent_station
    @curent_station
  end


  def next_station
    if @set_route.index_station(@curent_station) == @set_route.index_station(@set_route.last_station)
      "Станция #{@curent_station} конечная"
    else
      @next_index = @set_route.index_station(@curent_station) + 1
      set_route = @set_route.list_station
      @next_station = set_route.fetch(@next_index)
      "Следующая станция #{@next_station}"
    end
  end

  def show_next_station
    puts next_station
  end

  def move_next_station
    @curent_station = @next_station
  end

  def prev_station
    if @set_route.index_station(@curent_station) == @set_route.index_station(@set_route.first_station)
      "Станция #{@curent_station} начальная"
    else
      @prev_index = @set_route.index_station(@curent_station) - 1
      set_route = @set_route.list_station
      @prev_station = set_route.fetch(@prev_index)
      "Предыдущая станция #{@prev_station}"
    end

  end

  def show_prev_station
    puts prev_station
  end

  def move_prev_station
    @curent_station = @prev_station
  end


end