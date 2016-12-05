class Result < ActiveRecord::Base
  belongs_to :questionnaire
  has_many :category_ratings
end
