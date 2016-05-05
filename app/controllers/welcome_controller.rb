class WelcomeController < ApplicationController
  def index
    @adventures = Adventure.published.all
  end
end
