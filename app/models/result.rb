class Result < ActiveRecord::Base
  belongs_to :questionnaire
  has_many :category_ratings
  belongs_to :user
end
