class CreateApartments < ActiveRecord::Migration[7.0]
  def change
    create_table :apartments do |t|
      t.references :building, null: false, foreign_key: true
      t.string :unit
      t.decimal :price
      t.string :pricing_plan

      t.timestamps
    end
  end
end
