class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :body, :category_id, :default
  belongs_to :questionnaire
end
