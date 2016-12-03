class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :body
      t.string :category
      t.integer :user_id
      t.boolean :default

      t.timestamps null: false
    end
  end
end
