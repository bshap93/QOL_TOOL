class ResultsController < ApplicationController
  def create
    @questionnaire = Questionnaire.find(params[:result][:questionnaire_id])
    @result = Result.new
    @result.name = @questionnaire.name
    @result.questionnaire = @questionnaire
    if @result.save
      redirect_to display_category_path(@questionnaire, Category.first)
    else
      flash[:error] = "Invalid result"
      redirect_to root_path
    end
  end


end
