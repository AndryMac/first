class Station

  @@list_trains = []

  def initialize(name)
    @name =  name
  end

  def add_train(train)

   @@list_trains << [train]
  end

  def see_all_trains
    ps = @@list_trains.each {|x|  x }
    puts ps[0][3]

  end

  def del_train

  end

end

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


class Train

  @@default_speed = 0

  def initialize(number, type, lenght)
    @train = [number, type, lenght, @@default_speed]
  end

  def add_speed(add_spped)
    @train[3] =  add_spped
  end

  def see_speed
    puts "Текущая скорость поезда №#{@train[0]} - #{@train[3]} км/ч."
  end

  def del_speed
    @train[3] = @@default_speed
  end

  def see_lenght
    puts "Количество вагонов у поезда №#{@train[0]} - #{@train[2]} шт."
  end

  def add_lenght
    if @train[3] == 0
      @train[2] += 1
      puts "К составу №#{@train[0]} добавлен 1 вагон"
    else
      puts "Нельзя присоеденить вагон к составу пока он находится в движении."
    end
  end

  def del_lenght
    if @train[3] == 0
      @train[2] -= 1
      puts "У состава №#{@train[0]} убавлен 1 вагон"
    else
      puts "Нельзя отсоеденить вагон у состава пока он находится в движении."
    end
  end

  def route(route)
    @route = route
    @train[4] = @route.list_station #Получаем путевой лист для поезда
    @train[5] = @train[4].first #Первый элемент массива пути - текущая станция по дефолту (начало пути)
  end


  def next_route_station

    @curent_index = @train[4].index{ |x| x == @train[5]} #Получаем индекс текущей станции
    if @train[4].size - 1 != @curent_index
      @curent_index +=1
      @train[5] = @train[4].fetch(@curent_index) #Присваиваем в массив значение ткущей станции
    else
      puts "Поезд находится на конечной станции"
    end

  end

  def prev_route_station

    @curent_index = @train[4].index{ |x| x == @train[5]} #Получаем индекс текущей станции
    if @curent_index == 0
      puts "Поезд находится на начальной станции"

    else
      @curent_index -=1
      @train[5] = @train[4].fetch(@curent_index) #Присваиваем в массив значение ткущей станции
    end

  end


  def see_curent_station
    puts "Текущая станция #{@train[5]}"
  end

  def see_next_station
    if @train[4].size - 1 != @curent_index
       @next = @train[4].fetch(@curent_index + 1)
      puts "Следующая станция #{@next}"
    else
      puts "Поезд находится на конечной станции"
    end
  end

  def see_prev_station
    if @curent_index == 0
      puts "Поезд находится на начальной станции"
    else
      @curent_index -=1
      @prew = @train[4].fetch(@curent_index)
      puts "Предыдущая станция #{@prew}"
    end
  end

end


perm = Station.new("Perm")
moskow = Station.new("Moskow")

route_1 = Route.new("Perm", "Moskow")
route_1.first_station
route_1.last_station
route_1.add_medium_station("Perm")
route_1.add_medium_station("Pskov")
route_1.add_medium_station("Novgorod")
route_1.see_all_station
route_1.del_medium_station("Perm")
route_1.del_medium_station("Pskov")
route_1.see_all_station

puts
puts
route_2 = Route.new("Perm", "Spb")
route_2.add_medium_station("Kirov")
route_2.add_medium_station("Kazan")
route_2.add_medium_station("Moskow")
puts
puts
train_1 = Train.new(1465, "pass", 6)
train_1.add_speed(20)
train_1.del_speed
train_1.see_lenght
train_1.del_lenght
train_1.add_speed(70)
train_1.see_speed
train_1.route(route_1)
train_1.see_curent_station
train_1.next_route_station
train_1.see_curent_station
train_1.next_route_station
train_1.see_curent_station
train_1.next_route_station
train_1.prev_route_station
train_1.see_curent_station
puts
puts

train_1.see_next_station
train_1.prev_route_station
train_1.see_next_station
puts
puts
train_2 = Train.new(553, "cargo", 28)
train_2.route(route_2)


perm.add_train(train_1)
perm.add_train(train_2)
puts
puts perm.see_all_trains