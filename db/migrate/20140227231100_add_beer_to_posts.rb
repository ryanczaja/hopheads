class AddBeerToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :beer_id, :integer
    add_index :posts, :beer_id
  end
end
