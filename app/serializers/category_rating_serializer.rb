class CategoryRatingSerializer < ActiveModel::Serializer
  attributes :category, :rating
  belongs_to :result
  belongs_to :category
end
