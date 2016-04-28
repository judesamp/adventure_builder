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

end
