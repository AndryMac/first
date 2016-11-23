class Route

  attr_accessor :first_station, :station, :last_station, :index_next_station, :next_station, :index_prev_station, :prev_station

  def initialize(first_station, last_station)
    @route = [first_station, last_station]
    @first_station = first_station
    @last_station = last_station
  end

  def list_stations
    @route
  end

  def add_station(name)
    if @route.include?(name)
      puts "Станция #{name} уже есть в списке"
    else @route.insert(-2, name)
    puts "Станция #{name} добавлена в список"
    end
  end

  def remove_station(name)
    if name == @first_station
      puts "Станция #{name} является начальной и ее удалять нельзя"
    elsif name == @last_station
      puts "Станция #{name} является конечной и ее удалять нельзя"
    elsif @route.include?(name) == false
      puts "Станции #{name} нет в списке"
    else
      @route.delete(name)
      puts "Станция #{name} удалена из списка"
    end
  end

  def show_list_stations
    puts "Список станций #{@route}"
  end

  def index_station(name)
   @route.index(name)
  end

  def index_next_station(name)
    @index_next_station = @route.index(name).next
  end

  def index_prev_station(name)
    @index_prev_station = @route.index(name).pred
  end

  def next_station
    @next_station = @route.fetch(@index_next_station)
  end

  def prev_station
    @prev_station = @route.fetch(@index_prev_station)
  end

end


