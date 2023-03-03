class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
#  attribute :image, :string, default: 'default-avatar.png'
  
  mount_uploader :image, ImageUploader
  
end
