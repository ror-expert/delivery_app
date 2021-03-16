class MenuItem < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  validates_presence_of :title
  belongs_to :menu
end
