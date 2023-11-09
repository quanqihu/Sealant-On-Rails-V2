class RemoveIdFromChildLevelDetails < ActiveRecord::Migration[7.1]
  def change
    remove_column :child_level_details, :id
  end
end
