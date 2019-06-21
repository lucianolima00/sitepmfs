# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

['student', 'teacher', 'user'].each do |role|
    Role.find_or_create_by({name:role})
end

['1o Periodo', '2o Periodo', '3o Periodo', '4o Periodo', '5o Periodo', '6o Periodo', '7o Periodo'].each do |schoolroom|
    Schoolroom.find_or_create_by({name:schoolroom})
end