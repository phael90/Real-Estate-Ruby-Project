# CRUD testing console
require_relative( '../models/rental.rb' )
require_relative( '../models/flat.rb' )
require_relative( '../models/tenant.rb' )
require ( 'pry-byebug' )


Tenant.delete_all()
Flat.delete_all()
Rental.delete_all()




flat_1 = Flat.new({
  "location" => "Edinburgh",
  "available_space" => "1",
  "animal_friendly" => "true",
  "smokers_friendly" => "true"
  })

flat_2 = Flat.new({
  "location" => "New York City",
  "available_space" => "2",
  "animal_friendly" => "false",
  "smokers_friendly" => "false"
})

flat_3 = Flat.new({
  "location" => "Barcelona",
  "available_space" => "3",
  "animal_friendly" => "true",
  "smokers_friendly" => "false"
})

flat_1.save
flat_2.save
flat_3.save
# flat_1.location = "NYC"
# flat_1.update
# flat_1.delete
# p Flat.all
# p Flat.find(1)



tenant_1 = Tenant.new({
  "first_name" => "John",
  "last_name" => "Bolton",
  "age" => "23",
  "nationality" => "France",
  "gender" => "Male",
  "preferred_location" => "Edinburgh",
  "profession" => "student",
  "animal" => "true",
  "can_live_with_animal" => "true",
  "smoke" => "true",
  "can_live_with_smokers" => "true",
  # "flat_id" => flat_1.id
})

tenant_2 = Tenant.new({
  "first_name" => "Martin",
  "last_name" => "Johnson",
  "age" => "18",
  "nationality" => "United Kingdom",
  "gender" => "Male",
  "preferred_location" => "New York City",
  "profession" => "freelancer",
  "animal" => "true",
  "can_live_with_animal" => "true",
  "smoke" => "true",
  "can_live_with_smokers" => "true",
  # "flat_id" => flat_1.id
})

tenant_3 = Tenant.new({
  "first_name" => "Marie",
  "last_name" => "Murray",
  "age" => "30",
  "nationality" => "United Kingdom",
  "gender" => "Female",
  "preferred_location" => "New York City",
  "profession" => "freelancer",
  "animal" => "true",
  "can_live_with_animal" => "true",
  "smoke" => "true",
  "can_live_with_smokers" => "true",
  # "flat_id" => flat_1.id
})

tenant_1.save()
tenant_2.save()
tenant_3.save()
# p flat_1.tenants()
# tenant_1.flat()
# tenant_1.first_name = "Anthony"
# tenant_1.update
# tenant_1.delete
# p Tenant.all
# p Tenant.find(1)
# Tenant.delete_all
#
# rental_1 = Rental.new({
# "flat_id" => flat_1.id,
# "tenant_id" => tenant_1.id
# })
#
# rental_1.save()
# rental_1.flat_id = 2
# rental_1.update
# rental_1.delete
# p Rental.all
# p Rental.find(1)
# Rental.delete_all
# p rental_1.tenant()

#   binding.pry
# nil
