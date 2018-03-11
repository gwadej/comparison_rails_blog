class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :uuid
      t.string :title
      t.string :content
      t.references :blog, foreign_key: true

      t.timestamps
    end
    add_index :posts, :uuid, unique: true
  end
end
