class Station

  @@list_trains = []

  def initialize(name)
    @name =  name
  end

  def add_train(train)
    @@list_trains.push(train)
  end

  def see_type
    @@list_trains.each{|train|
      if train.type == "cargo"
        type = "Грузовой"
      else
        type = "Пассажирский"
      end
      puts "Поезд №#{train.number} - #{type}"
    }
  end

  def see_type_cargo
    cargo_trains = 0

    @@list_trains.each{|train|
      cargo_trains +=1 if train.type == 'cargo'
    }
    puts "На станции #{@name} находится #{cargo_trains} грузовых поезда(ов)"
  end

  def see_type_pass
    pass_trains = 0

    @@list_trains.each{|train|
      pass_trains +=1 if train.type == 'pass'
    }
    puts "На станции #{@name} находится #{pass_trains} пассажирских поезда(ов)"
  end


  def see_all_trains

    if @@list_trains.size > 0
      puts "На станции находятся поезда под номерами:"
      @@list_trains.each{|train|
        puts train.number
      }
    else
      puts "На станции нет поездов"
    end

  end

  def del_train(number_train)
     @@list_trains.delete_if{ |train| train.number == number_train }
  end

end