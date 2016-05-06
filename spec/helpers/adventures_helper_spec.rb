require 'rails_helper'

Spec.describe AdventuresHelper, type: :helper do

  describe '#adventure_description' do

    context 'description is nil' do 

      it 'returns a string informing user that no description exists if no description is present' do
        adventure = double("adventure", :description => nil)
        expect(helper.adventure_description(adventure)).to eq "There is no description available for this adventure."
      end

    end

    it 'returns the value of the description if description is not nil' do
      adventure = double("adventure", :description => 'not nil description')
      expect(helper.adventure_description(adventure)).to eq "not nil description"
    end

  end

end
