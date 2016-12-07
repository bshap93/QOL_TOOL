class QuestionnairesController < ApplicationController
  before_action :require_login
  def index
    current_user_id = current_user.id
    @questionnaires = Questionnaire.my_questionnaires(current_user_id)
  end

  def new
    @questionnaire = Questionnaire.new
    @user = current_user
  end

  def edit

  end

  def update

  end

  def create
    if params[:questionnaire][:default] == "1"
      @questionnaire = Questionnaire.first.deep_clone include: [:questions, :results]
    else
      @questionnaire = Questionnaire.new
    end
    @questionnaire.name = params[:questionnaire][:name]
    @questionnaire.default = params[:questionnaire][:default]
    @questionnaire.user = current_user
    if @questionnaire.save
      redirect_to questionnaire_path(@questionnaire)
    else
      redirect_to new_questionnaire_path
    end
  end

  def show
    @questionnaire = Questionnaire.find(params[:id])
  end

  private
  def questionnaire_params
    params.require(:questionnaire).permit(:name, :default)
  end

end
