class Result < ActiveRecord::Base
  belongs_to :questionnaire
  has_many :category_ratings
  has_many :categories, through: :category_ratings
  belongs_to :user
end
