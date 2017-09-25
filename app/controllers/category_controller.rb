class CategoryController < ApplicationController
  before_action :require_login
  @@category_count = 1


  def show
    if @@category_count > 14
      @@category_count = 1
    end
    @category = Category.find(@@category_count)
    @result = Result.find(session[:result_id])
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
    @questions = @category.return_questions_by_category.merge(@questionnaire.return_questions_by_questionnaire)
    if @questions.empty?
      @@category_count += 1
      unless @@category_count > 14
        redirect_to display_category_path(@questionnaire, Category.find(@@category_count))
      else
        redirect_to questionnaire_result_path(@questionnaire, Result.find(session[:result_id]))
      end
    end
    @category_rating = @category.category_rating.create(rating: 0)
    @rating = Rating.first
    @count = 1
  end

  def record
    @category_rating = CategoryRating.find(params[:id])
    @result = Result.find(session[:result_id])
    number_of_questions = params[:count].to_i - 1
    thecount = 1
    @category_rating.rating = 0
    number_of_questions.times do
      @category_rating.rating += params["rating_#{thecount}"].to_i
      thecount += 1
    end
    @result.category_ratings << @category_rating
    @category_rating.save
    @result.save
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
    @@category_count += 1
    unless @@category_count > 14
      respond_to do |format|
        @questions_in_category = @questionnaire.questions.where(category_id: @@category_count)
        format.json { render json: {category: Category.find(@@category_count), questions: @questions_in_category} }
        format.html { redirect_to display_category_path(@questionnaire, Category.find(@@category_count)) }
      end
    else
      redirect_to questionnaire_result_path(@questionnaire, Result.find(session[:result_id]))
    end
  end
end
