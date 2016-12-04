class AddDefaultToQuestionnaires < ActiveRecord::Migration
  def change
    add_column :questionnaires, :default, :boolean
  end
end
