class Category < ActiveRecord::Base
  has_one :category_rating
  has_many :questions
end
