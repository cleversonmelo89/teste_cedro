Restaurant.create(name: 'Restaurant1')
Restaurant.create(name: 'Restaurant2')
Restaurant.create(name: 'Restaurant3')
Restaurant.create(name: 'Restaurant4')
Restaurant.create(name: 'Restaurant5')

Restaurant.all.each do |restaurant|
  Plate.create(name: "prato 1", price: 20.90, restaurants_id: restaurant._id)
  Plate.create(name: "prato 2", price: 15.90, restaurants_id: restaurant._id)
  Plate.create(name: "prato 3", price: 30.90, restaurants_id: restaurant._id)
end
