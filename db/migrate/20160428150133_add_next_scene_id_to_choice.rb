class AddNextSceneIdToChoice < ActiveRecord::Migration
  def change
    add_column :choices, :next_scene_id, :integer
  end
end
