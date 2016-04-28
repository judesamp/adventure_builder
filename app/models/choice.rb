class Choice < ActiveRecord::Base
  belongs_to :scene
  has_one :next_scene, class_name: 'Scene'
end
