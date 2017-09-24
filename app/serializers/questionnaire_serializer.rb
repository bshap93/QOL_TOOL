class QuestionnaireSerializer < ActiveModel::Serializer
  attributes :id, :name, :default
  belongs_to :user, serializer: QuestionnaireUserSerializer
  has_many :questions
end
