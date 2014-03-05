class CreateBeerDescriptions < ActiveRecord::Migration
  def change
    create_table :beer_descriptions do |t|
      t.text :body

      t.timestamps
    end
  end
end
