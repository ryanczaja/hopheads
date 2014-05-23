class AddStylesToBeers < ActiveRecord::Migration
  def change
  	add_column :beers, :style_id, :integer
  	add_index :beers, :style_id
  end
end
