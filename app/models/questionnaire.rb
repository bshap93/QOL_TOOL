class Questionnaire < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  has_many :results

  validates :name, presence: true
  validates :default, presence: true
  validates :user, presence: true

  def self.my_questionnaires(current_user_id)
    Questionnaire.where("user_id = #{current_user_id}")
  end

  def self.all_questionnaires(current_user_id)
    Questionnaire.where("(user_id = #{current_user_id}) or (id = 1)")
  end
end
