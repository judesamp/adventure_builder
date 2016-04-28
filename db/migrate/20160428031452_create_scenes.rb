class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.text :content
      t.references :adventure, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
