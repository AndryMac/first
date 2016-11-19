class Station

  def initialize(name)
    @name =  name
    @list_trains = []
  end

  def take_train(train)
    @list_trains.push(train)
  end

  def show_all_trains

    if @list_trains.size > 0
      @list_trains.each do |train|
        puts "Поезд № #{train.number} - #{train.type_text}"
      end
    else
      puts "На станции нет поездов"
    end

  end

  def show_type_trains
    cargo_trains = @list_trains.select { |train| train.type == :cargo }.size
    passenger_trains = @list_trains.select { |train| train.type == :passenger }.size
    puts "На станции #{@name}: #{passenger_trains} - пассажирских поезда и #{cargo_trains} - грузовых "
  end

  def remove_train(number)
    @list_trains.delete_if{ |train| train.number == number }
  end

end