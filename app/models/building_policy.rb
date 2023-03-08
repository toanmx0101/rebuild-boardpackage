class BuildingPolicy < ApplicationRecord
  include TranslateEnum

  belongs_to :building
  belongs_to :policy

  validates_uniqueness_of :building_id, scope: [:policy_id]

  enum :policy_type, [:general, :finance, :additional], default: :general
  translate_enum :policy_type
end
