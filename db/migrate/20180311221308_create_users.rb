class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uuid
      t.string :userid
      t.string :name
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :uuid, unique: true
    add_index :users, :userid, unique: true
  end
end
