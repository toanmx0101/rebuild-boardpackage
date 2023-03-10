class Building < ApplicationRecord
  include TranslateEnum

  DEFAULT_COVER_IMAGE_URL = "/images/default-building.png".freeze

  has_many :apartments, dependent: :destroy
  has_many :building_policies, dependent: :destroy
  has_many :policies, through: :building_policies

  has_one_attached :cover_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [320, 220]
  end

  enum :residential_type, [:coop, :condo, :hoa, :land_trust], default: :coop
  translate_enum :residential_type

  def cover_image_url(size: nil)
    file = size && cover_image.variant(size).processed? ? cover_image.variant(size) : cover_image

    file_url(file) || DEFAULT_COVER_IMAGE_URL
  end
end
