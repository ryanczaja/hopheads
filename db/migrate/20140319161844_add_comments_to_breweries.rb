class AddCommentsToBreweries < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.references :brewery
    end
    add_index :comments, :brewery_id
  end
end
