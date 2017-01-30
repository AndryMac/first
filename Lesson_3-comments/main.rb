require './route'
require './station'
require './train'


perm = Station.new("Perm")

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
route_2 = Route.new("Perm", "Spb")
route_2.add_medium_station("Kirov")
route_2.add_medium_station("Kazan")
route_2.add_medium_station("Moskow")
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
train_1.see_next_station
train_1.prev_route_station
train_1.see_next_station
train_2 = Train.new(553, "cargo", 28)
train_2.route(route_2)
train_3 = Train.new(1583, "cargo", 15)
train_3.route(route_1)
puts
perm.add_train(train_1)
puts
perm.add_train(train_2)
perm.add_train(train_3)
perm.see_type_cargo
perm.see_type_pass
perm.see_all_trains
puts
perm.del_train(553)
perm.see_all_trains