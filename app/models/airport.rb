class Airport < ApplicationRecord
  has_many :departing_flights, inverse_of: :departure_airport, class_name: 'Flight'
  has_many :arriving_flights, inverse_of: :arrival_airport, class_name: 'Flight'
end
