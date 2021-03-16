class Menu < ApplicationRecord
  validates_presence_of :title
  
  has_many :menu_items, dependent: :destroy
end
