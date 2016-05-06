class ScenesController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :update, :edit, :index ]

  def index
  end

  def show
  end

  def new
    @scene = Scene.new(adventure_id: params[:adventure_id])
  end

  def create
  end

  def update
  end

  def edit
  end

  private
  def scene_params
    params.require(:scene).permit(:content, :adventure_id, choices_attributes: [:id, :content, :_destroy])
  end

end
