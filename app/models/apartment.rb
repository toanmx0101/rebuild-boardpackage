class Apartment < ApplicationRecord
  DEFAULT_IMAGE_URL = "/images/default-apartment.jpeg".freeze

  belongs_to :building

  has_one_attached :image do |attachable|
    attachable.variant :medium, resize_to_limit: [300, 300]
  end

  enum :status, [ :available, :occupied, :reserved, :renewed ], default: :available
  enum :pricing_plan, [:monthly, :daily, :anual], default: :monthly

  def price_cents
    Money.from_cents(price * 100).format
  end

  def image_url(size: nil)
    file = size && image.variant(size).processed? ? image.variant(size) : image
    file_url(file) || DEFAULT_IMAGE_URL
  end
end
