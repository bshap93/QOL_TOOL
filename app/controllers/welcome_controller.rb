class WelcomeController < ApplicationController
  before_action :require_login
  def index
    @result = Result.new
  end
end
