class QuestionnairesController < ApplicationController
  before_action :require_login
  def index
    current_user_id = current_user.id
    @questionnaires = Questionnaire.my_questionnaires(current_user_id)
  end

  def new
    @question_num = 0
    @questionnaire = Questionnaire.new
    @user = current_user
  end

  def edit
    @questionnaire = Questionnaire.find(params[:id])
    @user = current_user
  end

  def update
    if params[:questionnaire][:default] == "1" && params[:id] != "1"
      @questionnaire = Questionnaire.default_clone.combine(Questionnaire.find(params[:id]))
    else
      @questionnaire = Questionnaire.find(params[:id])
    end
    @questionnaire.name = params[:questionnaire][:name]
    @questionnaire.default = params[:questionnaire][:default]
    @questionnaire.user = current_user
    if @questionnaire.save
      redirect_to questionnaire_path(@questionnaire)
    else
      session[:errors] = @questionnaire.errors.full_messages
      redirect_to edit_questionnaire_path(@questionnaire)
    end
  end

  def create
    if params[:questionnaire][:default] == "1"
      @questionnaire = Questionnaire.default_clone
    else
      @questionnaire = Questionnaire.new
    end
    @questionnaire.name = params[:questionnaire][:name]
    @questionnaire.default = params[:questionnaire][:default]
    @questionnaire.user = current_user
    if !params[:questionnaire][:questions][:body].empty?
      @questionnaire.question_attributes = params[:questionnaire][:questions]
    end
    if @questionnaire.save
      redirect_to questionnaire_path(@questionnaire)
    else
      session[:errors] = @questionnaire.errors.full_messages
      redirect_to new_questionnaire_path
    end
  end

  def show
    @questionnaire = Questionnaire.find(params[:id])
    respond_to do |f|
      f.json { render json: @questionnaire, status: 201 }
      f.html { render :show }
    end

  end

  private
  def questionnaire_params
    params.require(:questionnaire).permit(:name, :default, questions_attributes: [:body, :category_id,])
  end



end
