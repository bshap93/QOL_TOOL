class ResultsController < ApplicationController
  before_action :require_login
  def create
    @questionnaire = Questionnaire.find(params[:result][:questionnaire_id])
    @result = Result.new
    @result.name = @questionnaire.name
    @result.questionnaire = @questionnaire
    @result.user = current_user
    @result.rating = 0
    if @result.save
      session[:result_id] = @result.id
      redirect_to display_category_path(@questionnaire, Category.first)
    else
      flash[:error] = "Invalid result"
      redirect_to root_path
    end
  end

  def display
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
    @result = Result.find(params[:id])
    @categories = Category.all
    @category_ratings = @result.category_ratings
    @category_ratings.each do |category_rating|
      @result.category_ratings << category_rating
      @result.rating += category_rating.rating
    end
    @result.save
  end

  def index
    @results = Result.where("user_id = #{current_user.id}")
  end

  def show
    @result = Result.find(params[:id])
    @categories = Category.all
  end


end
