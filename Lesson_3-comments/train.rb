class Train

  @@default_speed = 0

  def initialize(number, type, lenght)
    @train = [number, type, lenght, @@default_speed]
  end

  def number
    @train[0]
  end

  def type
    @train[1]
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