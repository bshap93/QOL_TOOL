class Category < ActiveRecord::Base
  has_many :category_rating
  has_many :questions

  def return_questions_by_category
    Question.where("category_id = #{self.id}")
  end

end
