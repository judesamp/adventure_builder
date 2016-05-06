class Scene < ActiveRecord::Base
  belongs_to :adventure
  has_many :choices
  accepts_nested_attributes_for :choices
end
