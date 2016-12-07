class CreateUser < ActiveRecord::Migration
  # Write your migrations here
  create_table :users do |t|
    t.string :name
    t.string :password_digest
    t.boolean :admin
    t.string :provider, null: false
    t.string :uid, null: false
    add_index :users, :provider
    add_index :users, :uid
    add_index :users, [:provider, :uid], unique: true
  end
end
