class AddQIdToResults < ActiveRecord::Migration
  def change
    add_column :results, :questionnaire_id, :integer
  end
end
