class Route

  attr_accessor :first_station, :station, :last_station

  def initialize(first_station, last_station)
    @route = [first_station, last_station]
    @first_station = first_station
    @last_station = last_station
  end

  def list_stations
    @route
  end

  def add_station(station)
    if @route.include?(station)
      puts "Станция #{station} уже есть в списке"
    else @route.insert(-2, station)
    puts "Станция #{station} добавлена в список"
    end
  end

  def remove_station(station)
    if station == @first_station
      puts "Станция #{station} является начальной и ее удалять нельзя"
    elsif station == @last_station
      puts "Станция #{station} является конечной и ее удалять нельзя"
    elsif @route.delete(station)
      puts "Станция #{station} удалена из списка"
    else
      @route.include?(station)
      puts "Станции #{station} нет в списке"
    end
  end

  def show_list_stations
    puts "Список станций #{@route}"
  end

end