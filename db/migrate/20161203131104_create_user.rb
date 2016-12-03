class CreateUser < ActiveRecord::Migration
  # Write your migrations here
  create_table :users do |t|
    t.string :name
    t.string :password_digest
    t.boolean :admin
  end
end
