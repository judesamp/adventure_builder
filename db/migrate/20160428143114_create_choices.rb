class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.text :content
      t.references :scene, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
