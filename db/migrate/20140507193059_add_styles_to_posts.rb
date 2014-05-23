class AddStylesToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :style_id, :integer
    add_index :posts, :style_id
  end
end
