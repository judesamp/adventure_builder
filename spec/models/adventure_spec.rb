require 'rails_helper'

RSpec.describe Adventure, type: :model do

  it 'has a valid factory' do
    expect(FactoryGirl.build(:adventure)).to be_valid
  end

  # Database
  #----------------------------------------------------------------------------
  describe "database", :database => true do
    it { should have_db_column(:id) }
    it { should have_db_column(:title) }
    it { should have_db_column(:author) }
    it { should have_db_column(:published) }

    it { should have_db_column(:created_at) }
    it { should have_db_column(:updated_at) }
  end

  # Associations
  #----------------------------------------------------------------------------

  describe "associations", :associations => true do

    describe "user" do
      it { should belong_to(:user) }
    end

    describe "scenes" do
      it { should have_many(:scenes) }
    end

    # describe "tours" do
    #   it { should have_many(:tours) }
    # end

  end

  # Default values
  #----------------------------------------------------------------------------
  describe 'default values' do

    it 'should set published to false' do
      adventure = FactoryGirl.build(:adventure)
      expect(adventure.published).to be false
    end

  end

  # scopes
  #----------------------------------------------------------------------------
  describe 'scopes' do

    context 'default scope' do

      it 'returns all adventures ordered by created at (desc)' do
        yesterdays_adventure = FactoryGirl.create(:adventure, published: true, created_at: Time.zone.now - 24.hours)
        todays_adventure = FactoryGirl.create(:adventure, created_at: Time.zone.now)
        expect(Adventure.all).to eq [todays_adventure, yesterdays_adventure]
      end

    end

    context 'published scope' do

      it 'returns all published aventures' do
        published_adventures = FactoryGirl.create_list(:adventure, 3, published: true)
        unpublished_adventures = FactoryGirl.create_list(:adventure, 3)
        expect(Adventure.published.all).to match_array published_adventures
      end

    end

  end

end
