class AddCommentsToBeers < ActiveRecord::Migration
  def change
  	change_table :comments do |t|
      t.references :beer
    end
    add_index :comments, :beer_id
  end
end
