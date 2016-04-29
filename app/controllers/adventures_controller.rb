class AdventuresController < ApplicationController

  def index
    @adventures = current_user.adventures
  end

  def new
    @adventure = Adventure.new
  end

end
