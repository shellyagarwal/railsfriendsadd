class CirclesUsers < ActiveRecord::Migration
  def change
  	create_table :circles_users do |t|
  		t.references :circle
  		t.references :user
  	end
  end
end
