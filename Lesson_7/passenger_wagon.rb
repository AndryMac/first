class PassengerWagon < Wagon

  attr_reader :occupied_seats, :empty_seats

  def initialize(empty_seats)
    @type = :passenger
    @empty_seats = empty_seats
    @occupied_seats = 0
    super(@type)
  end

  def add_passanger
    if @occupied_seats == @empty_seats
      puts "Свободных мест в вагоне нет"
    else
      @occupied_seats += 1
    end
  end

  def show_empty_seats
    puts "Свободных мест в вагоне #{@empty_seats - @occupied_seats}"
  end

  def show_occupied_seats
    puts "В вагоне занято #{@occupied_seats} мест"
  end



end
