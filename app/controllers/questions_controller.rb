class QuestionsController < ApplicationController
  def index
    @questions = Question.where("questionnaire_id = 1")
  end
end
