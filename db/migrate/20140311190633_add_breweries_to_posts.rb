class AddBreweriesToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :brewery, :string
  	add_index :posts, :brewery
  end
end
