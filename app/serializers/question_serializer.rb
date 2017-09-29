class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :body, :category, :user, :default
  belongs_to :questionnaire
  belongs_to :category
  belongs_to :user
end
