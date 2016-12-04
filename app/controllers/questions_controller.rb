class QuestionsController < ApplicationController
  def index
    @questions = Question.where("(questionnaire_id = 1) or (user_id = #{current_user.id})")
  end

  def show
    @question = Question.find(params[:id])
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
  end

  def questionnaire_select
    @question = Question.find(params[:id])
  end

  def update_questionnaire
    raise params
  end
end
