require_relative 'route'
require_relative'station'
require_relative 'train'


list1 = Route.new("Perm", "Moskow")
list1.add_station("Kazan")
list1.add_station("Perm")
list1.add_station("Novgogrod")
list1.add_station("Penza")
list1.remove_station("kava")
list1.remove_station("Perm")
list1.remove_station("Kazan")
list1.show_list_station

list2 = Route.new("Perm", "Spb")
list2.add_station("Kirov")
list2.add_station("Pskov")
list2.add_station("Moskow")
list2.show_list_station




train1 = Train.new(123, :passenger)
train1.change_speed(70)
train1.show_speed
train1.add_wagon
train1.down_speed
train1.add_wagon
train1.show_speed
train1.show_wagons_count
train1.del_wagon
train1.del_wagon
train1.del_wagon
train1.del_wagon
train1.show_wagons_count
train1.set_route(list1)
train1.show_prev_station
train1.show_next_station
train1.move_prev_station
train1.move_next_station
train1.show_prev_station
train1.show_next_station
train2 = Train.new(356, :cargo)
train2.set_route(list1)
train3 = Train.new(7789, :cargo)
train3.set_route(list1)

station1 = Station.new("Perm")
station1.take_train(train1)
station1.take_train(train2)
station1.take_train(train3)
station1.show_all_trains
station1.show_type_trains
station1.remove_train(356)
station1.show_all_trains

