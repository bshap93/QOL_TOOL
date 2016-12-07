class Question < ActiveRecord::Base
  belongs_to :questionnaire
  belongs_to :user
  belongs_to :category


end
