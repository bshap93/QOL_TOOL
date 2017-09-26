class QuestionsController < ApplicationController
  before_action :require_login
  def index
    @questions = Question.where("(questionnaire_id = #{params[:questionnaire_id]})")
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
  end

  def new
    @question = Question.new
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
  end

  def create
    @question = Question.new
    @question.body = params[:question][:body]
    @question.category = Category.find(params[:question][:category_id])
    @question.questionnaire = Questionnaire.find(params[:questionnaire_id])
    if @question.save
      redirect_to questionnaire_path(params[:questionnaire_id])
    else
      session[:errors] = @question.errors.full_messages
      redirect_to new_questionnaire_question_path(@question.questionnaire)
    end
  end

  def edit
    @question = Question.find(params[:id])
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
  end

  def update
    @question = Question.find(params[:id])
    @question.body = params[:question][:body]
    @question.category = Category.find(params[:question][:category_id])
    @question.questionnaire = Questionnaire.find(params[:questionnaire_id])
    if @question.save
      redirect_to questionnaire_path(params[:questionnaire_id])
    else
      session[:errors] = @question.errors.full_messages
      redirect_to edit_questionnaire_question_path(@question.questionnaire, @question)
    end
  end


  def show
    @question = Question.find(params[:id])
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
  end

  def destroy
    @question = Question.find(params[:id])
    @questionnaire = @question.questionnaire
    @question.delete
    redirect_to questionnaire_path(@questionnaire.id)
  end


  def update_questionnaire
    @questionnaire = Questionnaire.find(params[:question][:questionnaire_id])
    @question = Question.find(params[:id])
    @question.questionnaire = @questionnaire

    redirect_to questionnaire_questions_path(@questionnaire.id)
  end

  private
  def question_params
    params.require(:question).permit(:body, :category_id)
  end
end
