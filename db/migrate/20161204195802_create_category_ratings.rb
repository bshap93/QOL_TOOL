class CreateCategoryRatings < ActiveRecord::Migration
  def change
    create_table :category_ratings do |t|
      t.integer :category_id
      t.integer :rating
      t.integer :result_id

      t.timestamps null: false
    end
  end
end
