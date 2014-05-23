class AddBeersToStyles < ActiveRecord::Migration
  def change
  	add_column :styles, :beer_id, :integer
  	add_index :styles, :beer_id
  end
end
