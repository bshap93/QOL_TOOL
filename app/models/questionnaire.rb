class Questionnaire < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  has_many :results

  def self.my_questionnaires(current_user_id)
    Questionnaire.where("user_id = #{current_user_id}")
  end

end
