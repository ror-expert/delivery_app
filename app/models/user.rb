class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  before_create :assign_default_role
  
  def admin?
    has_role? :admin
  end

  private
    def assign_default_role
      self.add_role(:user) if self.roles.blank?
    end
end
