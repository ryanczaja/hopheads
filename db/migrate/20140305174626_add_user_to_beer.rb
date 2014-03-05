class AddUserToBeer < ActiveRecord::Migration
  def change
  	change_table :beers do |t|
  		t.integer :user_id
  	end
  end
end
