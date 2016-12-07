class Question < ActiveRecord::Base
  belongs_to :questionnaire
  belongs_to :user
  belongs_to :category

  validates :body, presence: true
  validates :category_id, presence: true


end
