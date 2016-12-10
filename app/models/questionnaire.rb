class Questionnaire < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  has_many :results

  validates :name, presence: true
  validates :user, presence: true

  def self.my_questionnaires(current_user_id)
    Questionnaire.where("user_id = #{current_user_id}")
  end

  def self.all_questionnaires(current_user_id)
    Questionnaire.where("(user_id = #{current_user_id}) or (id = 1)")
  end

  def return_questions_by_questionnaire
    Question.where("questionnaire_id = #{self.id}")
  end

  def self.default_clone
    self.first.deep_clone include: [:questions, :results]
  end

  def combine(second)
    self.name = second.name
    self.user_id = second.user_id
    self.default = second.default
    self.results.each do |result|
      second.results << result
    end
    self.questions.each do |question|
      second.questions << question
    end
    second.save
    return second
  end

  def question_attributes=(question_attributes)
    question = Question.new
    question.body = question_attributes[:body]
    question.category = Category.find(question_attributes[:category_id])
    self.save
    question.questionnaire = self
    question.save
    self.questions << question
    self.save
  end

end
