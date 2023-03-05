class CreateBuildingPolicies < ActiveRecord::Migration[7.0]
  def change
    create_table :building_policies do |t|
      t.references :building, foreign_key: true
      t.references :policy, foreign_key: true

      t.timestamps
    end
  end
end
