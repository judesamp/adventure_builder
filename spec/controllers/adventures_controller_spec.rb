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

  describe "GET #show" do
    let(:adventure) { FactoryGirl.create(:adventure) }

    it "returns http success" do
      get :show, id: adventure
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get :show, id: adventure
      expect(response).to render_template :show
    end

    it "assigns the specified adventure to @adventure" do
      get :show, id: adventure
      expect(assigns(:adventure)).to eq adventure
    end

  end

  describe "POST #create" do

    context 'valid adventure' do

      let(:adventure_attrs) { { adventure: FactoryGirl.attributes_for(:adventure) }  }

      it "returns http success" do
        post :create, adventure_attrs
        expect(response).to have_http_status(:redirect)
      end

      it "renders the index template" do
        post :create, adventure_attrs
        expect(response).to redirect_to Adventure.last
      end

      it "creates an adventure" do
        expect {
          post :create, adventure_attrs
        }.to change(Adventure, :count).by(1)
      end

    end

    context 'invalid adventure' do

      let(:invalid_adventure_attrs) { { adventure: FactoryGirl.attributes_for(:adventure, title: nil) }  }

      it "returns http success" do
        post :create, invalid_adventure_attrs
        expect(response).to have_http_status(:success)
      end

      it "renders the index template" do
        post :create, invalid_adventure_attrs
        expect(response).to render_template :new
      end

      it "creates an adventure" do
        expect {
          post :create, invalid_adventure_attrs
        }.to change(Adventure, :count).by(0)
      end

    end

  end

end
