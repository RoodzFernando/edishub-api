class RemoveResourceIdFromCategory < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :resource_id, :integer
  end
end
