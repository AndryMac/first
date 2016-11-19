class Route

  attr_accessor :first_station, :station, :last_station

  def initialize(first_station, last_station)
    @route = [first_station, last_station]
    @first_station = first_station
    @last_station = last_station
  end

  def first_station
    @first_station
  end

  def last_station
    self
    @last_station
  end

  def list_station
    @route
  end

  def add_station(name_station)
    if @route.include?(name_station) && name_station == @first_station
      puts "Станция #{name_station} является начальной"
    elsif @route.include?(name_station) && name_station == @last_station
      puts "Станция #{name_station} является конечной"
    elsif @route.include?(name_station)
      puts "Станция #{name_station} уже есть в списке"
    else @route.insert(-2, name_station)
    puts "Станция #{name_station} добавлена в список"
    end
  end

  def remove_station(name_station)
    if @route.include?(name_station) && name_station == @first_station
      puts "Станция #{name_station} является начальной и ее удалять нельзя"
    elsif @route.include?(name_station) && name_station == @last_station
      puts "Станция #{name_station} является начальной и ее удалять нельзя"
    elsif @route.include?(name_station) == false
      puts "Станции #{name_station} нет в списке"
    else
      @route.delete(name_station)
      puts "Станция #{name_station} удалена из списка"
    end
  end

  def show_list_station
    puts "Список станций #{@route}"
  end

  def index_station(name_station)
    @route.index(name_station)
  end

end