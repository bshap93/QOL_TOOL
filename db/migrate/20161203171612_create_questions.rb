class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :body
      t.integer :category_id
      t.integer :user_id
      t.boolean :default

      t.timestamps null: false
    end
  end
end
