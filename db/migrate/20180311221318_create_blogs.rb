class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :uuid
      t.string :title
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :blogs, :uuid, unique: true
  end
end
