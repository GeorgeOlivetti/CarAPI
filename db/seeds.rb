# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cars_list = [
    ["JTDKB20U177686018", "Toyota", "RAV4", 2014, "White", "Adam", "West"],
    ["2G1WL52K8X9224624", "Toyota", "Camry", 2012, "Black", "Adam", "West"],
    ["1GTDM19X22B542140", "Chevrolet", "Trailblazer", 2003, "Blue", "Matthew", "West"],
    ["1FMDU63W62UC69541", "Ford", "F-150", 2010, "Black", "Michael", "Scott"],
    ["JYARN20E98A095417", "Honda", "Civic", 2012, "Silver", "Andrew", "Johnson"],
    ["1FTFF26E3BKA36053", "BMW", "i8", 2019, "White", "John", "Smith"]
]

cars_list.each do |vin, make, model, year, color, ownerFirstName, ownerLastName|
  Car.create( vin: vin, make: make, model: model, year: year, color: color, ownerFirstName: ownerFirstName, ownerLastName: ownerLastName )
end