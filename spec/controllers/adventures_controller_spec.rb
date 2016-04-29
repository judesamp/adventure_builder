require 'rails_helper'

RSpec.describe AdventuresController, type: :controller do
  login_user

  describe "GET #index" do

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns the current user's adventures to @adventures" do
      FactoryGirl.create_list(:adventure, 5, user: subject.current_user)
      current_users_adventures = subject.current_user.adventures
      get :index
      expect(assigns(:adventures)).to eq current_users_adventures
    end

  end

  describe "GET #new" do

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end

    it "assigns a new Adventure to @adventure" do
      get :new
      expect(assigns(:adventure)).to be_a_new Adventure
    end

  end

end