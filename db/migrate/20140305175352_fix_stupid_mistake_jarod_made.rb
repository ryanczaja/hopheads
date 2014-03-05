class FixStupidMistakeJarodMade < ActiveRecord::Migration
  def up
  	remove_column :beers, :user_id
  	change_table :beers do |t|
  		t.integer :post_id
  	end
  end

  def down
  end
end
