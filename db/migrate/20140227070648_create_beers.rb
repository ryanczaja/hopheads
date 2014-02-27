class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.references :brewery
      t.string :style
      t.string :abv
      t.text :description

      t.timestamps
    end
    add_index :beers, :brewery_id
  end
end
