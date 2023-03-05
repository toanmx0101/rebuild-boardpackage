class ApartmentAmenity < ApplicationRecord
  belongs_to :apartment
  belongs_to :amenity
end
