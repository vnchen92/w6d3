class Change3 < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :artwork_id
    remove_column :likes, :comment_id
  end
end
