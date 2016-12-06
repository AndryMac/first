class CargoWagon < Wagon

  attr_reader :load_capacity, :capacity


  def initialize(capacity)
    @type = :cargo
    @capacity = capacity
    @load_capacity = 0
    super(@type)
  end

  def add_cargo(load_capacity)
    if @load_capacity > @capacity
      puts "Грузоподъемность вагона меньше объема который вы загружаете"
    else
      @load_capacity = load_capacity
    end
  end

  def show_load_capacity
    puts "Объем груза в вагоне #{@load_capacity}"
  end

  def show_free_capacity
    puts "Объем свободного места в вагоне: #{@capacity - @load_capacity}"
  end

end