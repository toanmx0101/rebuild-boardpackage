class CreateApartmentAmenities < ActiveRecord::Migration[7.0]
  def change
    create_table :apartment_amenities do |t|
      t.references :apartment, null: false, foreign_key: true
      t.references :amenity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
