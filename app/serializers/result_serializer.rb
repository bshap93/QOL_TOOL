class ResultSerializer < ActiveModel::Serializer
  attributes :id, :name, :rating
  has_many :category_ratings
  has_many :categories, through: :category_ratings
end
