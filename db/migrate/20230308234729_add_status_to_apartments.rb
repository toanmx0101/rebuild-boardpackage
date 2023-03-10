class AddStatusToApartments < ActiveRecord::Migration[7.0]
  def change
    add_column :apartments, :status, :integer
  end
end
