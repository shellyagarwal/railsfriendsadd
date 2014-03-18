class RenameColumnOwner < ActiveRecord::Migration
  def change
  	rename_column :circles, :owner_id, :user_id
  end
end
