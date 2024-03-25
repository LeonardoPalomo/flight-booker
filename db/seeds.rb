# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#

codes = ["GER", "NYC", "STG", "DBI", "KOR", "RAN", "JPN", "CHN", "CHI", "POR"]

# codes.each do |code_name|
#   Airport.find_or_create_by!(code: code_name)
# end

10.times do 
  airports = Airport.all.to_a
  f = Flight.new

  start_airport = airports.sample
  f.departure_airport = start_airport
  p "departure airport"
  p start_airport
  airports.delete(start_airport)

  finish_airport = airports.sample

  p "arrival airport"
  p finish_airport
  f.arrival_airport = finish_airport
  date = rand(-1.years..1.years).ago
  p "date"
  p date

  f.flight_date = date
  duration = rand(30..300)
  p "duration"
  p duration
  
  f.flight_duration = duration
  passengers = rand(150..500)
  p "passengers"
  p passengers

  f.passengers = passengers
  p "is this valid?"
  p f.valid?
  f.save
end


