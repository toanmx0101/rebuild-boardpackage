class AddPolicyTypeToBuildingPolicies < ActiveRecord::Migration[7.0]
  def change
    add_column :building_policies, :policy_type, :integer, default: 0
  end
end
