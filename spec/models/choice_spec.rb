require 'rails_helper'

RSpec.describe Choice, type: :model do

  it 'has a valid factory' do
    expect(FactoryGirl.build(:choice)).to be_valid
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

    describe "scene" do
      it { should belong_to(:scene) }
    end

    describe "scene" do
      it { should have_one(:next_scene) }
    end

  end

end
