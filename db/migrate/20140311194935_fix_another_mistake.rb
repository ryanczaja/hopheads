class FixAnotherMistake < ActiveRecord::Migration
  def up
  	change_table :breweries do |t|
  		t.integer :post_id
  	end
  end

  def down
  end
end
