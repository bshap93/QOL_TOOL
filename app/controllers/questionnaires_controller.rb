class QuestionnairesController < ApplicationController
  def index
    current_user_id = current_user.id
    @questionnaires = Questionnaire.my_questionnaires(current_user_id)
  end

end
