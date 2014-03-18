class AddColumnToCircle < ActiveRecord::Migration
  def change
    add_column :circles, :circle_name, :string
    add_column :circles, :owner_id, :integer
  end
end
