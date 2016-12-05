class QuestionsController < ApplicationController
  def index
    @questions = Question.where("(questionnaire_id = 1) or (user_id = #{current_user.id})")
  end

  def show
    @question = Question.find(params[:id])
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
  end

  def destroy
    @question = Question.find(params[:id])
    @questionnaire = @question.questionnaire
    @question.delete
    redirect_to questionnaire_questions_path(@questionnaire.id)
  end

  def questionnaire_select

  end

  def update_questionnaire
    @questionnaire = Questionnaire.find(params[:question][:questionnaire_id])
    @question = Question.find(params[:id])
    @question.questionnaire = @questionnaire

    redirect_to questionnaire_questions_path(@questionnaire.id)
  end
end
