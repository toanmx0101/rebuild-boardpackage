class AddDescriptionAndResidentialTypeToBuildings < ActiveRecord::Migration[7.0]
  def change
    add_column :buildings, :residential_type, :integer
    add_column :buildings, :description, :text
  end
end
