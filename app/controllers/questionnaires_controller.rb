class QuestionnairesController < ApplicationController
  def index
    current_user_id = current_user.id
    @questionnaires = Questionnaire.my_questionnaires(current_user_id)
  end

  def new
    @questionnaire = Questionnaire.new
  end

  def create
    @questionnaire = Questionnaire.new(questionnaire_params)
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
