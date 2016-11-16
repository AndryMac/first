class Route


  def initialize(first_station, last_station)
    @list_station = [first_station, last_station]
  end

  def first_station
    @list_station.first
  end

  def last_station
    @list_station.last
  end

  def add_medium_station(name_medium_station)
    if @list_station.include?(name_medium_station)
      puts "Станция #{name_medium_station} уже есть в списке"
    else
      @list_station.insert(-2, name_medium_station)
      puts "Станция #{name_medium_station} добавлена в список"
    end
  end

  def see_all_station
    puts "Список станций: #{@list_station}"
  end

  def del_medium_station(del_name)
    if first_station == del_name
      puts "Станция #{del_name} является начальной и ее удалить нельзя"
    elsif
    last_station == del_name
      puts "Станция #{del_name} является конечной и ее удалить нельзя"
    else
      @list_station.reject!{|station| station == del_name}
      puts "Станция #{del_name} удалена из списка"
    end
  end

  def list_station
    @list_station
  end

end