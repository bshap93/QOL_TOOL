class QuestionsController < ApplicationController
  before_action :require_login
  def index
    @questions = Question.where("(questionnaire_id = 1) or (user_id = #{current_user.id})")
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
    @question.save
    redirect_to questionnaire_path(params[:questionnaire_id])
  end

  def edit
    @question = Question.find(params[:id])
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
  end

  def update
    raise params.inspect
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

  private
  def question_params
    params.require(:question).permit(:body, :category_id)
  end
end
