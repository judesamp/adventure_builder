class AddChoiceIdToScenes < ActiveRecord::Migration
  def change
    add_column :scenes, :choice_id, :integer
  end
end
