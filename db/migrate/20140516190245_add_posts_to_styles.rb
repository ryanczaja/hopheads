class AddPostsToStyles < ActiveRecord::Migration
  def change
  	add_column :styles, :post_id, :integer
  end
end
