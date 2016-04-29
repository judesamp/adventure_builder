class Scene < ActiveRecord::Base
  belongs_to :adventure
  has_many :choices
end
