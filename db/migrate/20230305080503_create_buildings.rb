class CreateBuildings < ActiveRecord::Migration[7.0]
  def change
    create_table :buildings do |t|
      t.string :name
      t.text :address
      t.decimal :lat
      t.decimal :long
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
