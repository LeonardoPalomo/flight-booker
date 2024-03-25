class Booking < ApplicationRecord
  has_many :traveller
  belongs_to :flight

  accepts_nested_attributes_for :travellers
end
