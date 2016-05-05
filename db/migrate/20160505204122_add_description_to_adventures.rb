class AddDescriptionToAdventures < ActiveRecord::Migration
  def change
    add_column :adventures, :description, :text
  end
end
