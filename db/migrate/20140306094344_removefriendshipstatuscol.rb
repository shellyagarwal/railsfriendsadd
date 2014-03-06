class Removefriendshipstatuscol < ActiveRecord::Migration
  def change
remove_column :friendships ,:status, :string
  end
end
