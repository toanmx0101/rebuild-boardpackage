class Apartment < ApplicationRecord
  belongs_to :building

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/default-apartment.png"

  def price_cents
    Money.from_cents(price * 100).format
  end
end
