class Question < ActiveRecord::Base
  belongs_to :questionnaire
  belongs_to :user
  has_one :category


end
