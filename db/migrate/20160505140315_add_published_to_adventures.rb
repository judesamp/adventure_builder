class AddPublishedToAdventures < ActiveRecord::Migration
  def change
    add_column :adventures, :published, :boolean, default: false
  end
end
