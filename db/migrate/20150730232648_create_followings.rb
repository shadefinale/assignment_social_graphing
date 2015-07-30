class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :following_id
      t.integer :followed_id
      t.timestamps null: false
    end
  end
end
