class AdventuresController < ApplicationController
  before_action :authenticate_user!, only: [ :index, :new ]

  def index
    @adventures = current_user.adventures
  end

  def new
    @adventure = Adventure.new
  end

  def show
    @adventure = Adventure.find(params[:id])
  end

end
