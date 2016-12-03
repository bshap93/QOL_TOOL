class ChangeOwner < ActiveRecord::Migration
  def change
    rename_column :questions, :user_id, :questionnaire_id
  end
end
