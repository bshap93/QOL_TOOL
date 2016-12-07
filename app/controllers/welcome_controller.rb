class WelcomeController < ApplicationController
  def index
    @result = Result.new
  end
end
