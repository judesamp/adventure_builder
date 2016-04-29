require 'rails_helper'

RSpec.describe Scene, type: :model do

  it 'has a valid factory' do
    expect(FactoryGirl.build(:scene)).to be_valid
  end

  # Database
  #----------------------------------------------------------------------------
  describe "database", :database => true do
    it { should have_db_column(:id) }
    it { should have_db_column(:content) }

    it { should have_db_column(:created_at) }
    it { should have_db_column(:updated_at) }
  end

  # Associations
  #----------------------------------------------------------------------------

  describe "associations", :associations => true do

    describe "adventure" do
      it { should belong_to(:adventure) }
    end

    describe "choice" do
      it { should have_many(:choices) }
    end

  end

end
