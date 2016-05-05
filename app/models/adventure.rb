class Adventure < ActiveRecord::Base
  has_many :scenes
  belongs_to :user

  default_scope { order("created_at desc") }
  scope :published, -> { where(published: true) }
end
