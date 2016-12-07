class PassengerWagon < Wagon
  attr_reader :occupied_seats, :total_seats

  def initialize(total_seats)
    @type = :passenger
    @total_seats = total_seats
    @occupied_seats = 0
    super(:passenger)
  end

  def add_passanger
    if @occupied_seats == @total_seats
      puts 'Свободных мест в вагоне нет'
    else
      @occupied_seats += 1
    end
  end

  def empty_seats
    @total_seats - @occupied_seats
  end

  def show_empty_seats
    puts "Свободных мест в вагоне #{empty_seats}"
  end

  def show_occupied_seats
    puts "В вагоне занято #{@occupied_seats} мест"
  end
end
