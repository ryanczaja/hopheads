class AddIbuToBeers < ActiveRecord::Migration
  def change
  	add_column :beers, :ibu, :integer
  	add_index :beers, :ibu
  end
end
