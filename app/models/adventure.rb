class Adventure < ActiveRecord::Base
  has_many :scenes
  belongs_to :user
end
