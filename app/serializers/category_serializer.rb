class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :questions

  def questions
    binding.pry
    object.questions.where(questionnaire_id: 2)
  end
end
