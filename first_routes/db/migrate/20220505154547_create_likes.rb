class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :artwork_id
      t.integer :comment_id
      t.integer :user_id, null:false
      t.timestamps
    end

    add_index :likes, :artwork_id 
    add_index :likes, :user_id
    add_index :likes, :comment_id 
    add_index :likes, [:comment_id, :user_id], unique:true
    add_index :likes, [:artwork_id, :user_id], unique:true
  end
end
