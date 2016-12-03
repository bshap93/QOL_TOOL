class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :name
      t.string :category
      t.integer :rating

      t.timestamps null: false
    end
  end
end
