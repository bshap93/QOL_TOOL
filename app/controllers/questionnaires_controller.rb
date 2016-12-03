class QuestionnairesController < ApplicationController
  def index
    current_user_id
    @questionnaires = Questionnaire.where("user")
  end
end
