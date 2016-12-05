class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.string :designation

      t.timestamps null: false
    end
  end
end
