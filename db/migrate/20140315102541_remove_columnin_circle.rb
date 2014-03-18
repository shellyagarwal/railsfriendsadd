class RemoveColumninCircle < ActiveRecord::Migration
  def change
  	remove_column :circles, :friendship_id
  end
end
