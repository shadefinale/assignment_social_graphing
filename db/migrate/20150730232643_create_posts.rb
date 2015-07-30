class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :body, limit: 144
      t.references :user
      t.timestamps null: false
    end
  end
end
