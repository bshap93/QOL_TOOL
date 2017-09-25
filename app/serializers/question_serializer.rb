class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :body, :category_id, :default
  belongs_to :questionnaire
  belongs_to :category
end
