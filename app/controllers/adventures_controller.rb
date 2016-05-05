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

  def create
    @adventure = Adventure.new(adventure_params)

    if @adventure.save
      redirect_to @adventure, notice: 'Your adventure has been created successfully.'
    else
      render action: :new
    end
  end

  private
  def adventure_params
    params.require(:adventure).permit(:title, :author, :description, :user_id)
  end

end
