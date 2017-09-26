class ResultSerializer < ActiveModel::Serializer
  attributes :id, :name, :rating
  has_many :category_ratings
end
