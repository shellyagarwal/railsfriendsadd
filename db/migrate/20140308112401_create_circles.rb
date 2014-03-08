class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.references :user
      t.references :friendship
      t.string :circle_name

      t.timestamps
    end
  end
end
