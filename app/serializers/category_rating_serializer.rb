class CategoryRatingSerializer < ActiveModel::Serializer
  attributes :id, :category, :rating
  belongs_to :result
  belongs_to :category
end
