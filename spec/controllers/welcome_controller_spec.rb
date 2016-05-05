require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  login_user

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      published_adventures = FactoryGirl.create_list(:adventure, 3, published: true)
      unpublished_adventures = FactoryGirl.create_list(:adventure, 3)
      get :index
      expect(assigns(:adventures)).to match_array published_adventures
    end
  end

end
