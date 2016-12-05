class CategoryController < ApplicationController
  @@category_count = 1

  def show
    @category = Category.find(@@category_count)
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
    @questions = @category.return_questions_by_category.merge(@questionnaire.return_questions_by_questionnaire)
    @category_rating = @category.category_rating.create
    @rating = Rating.first
  end

  def record
    raise params.inspect
  end
end
