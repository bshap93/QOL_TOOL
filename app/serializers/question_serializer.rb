class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :body, :category, :user, :questionnaire, :default
  belongs_to :questionnaire
  belongs_to :category
  belongs_to :user
end
