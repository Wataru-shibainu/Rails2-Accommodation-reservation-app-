class Room < ApplicationRecord
  
  belongs_to :user
  
  mount_uploader :hotel_image, ImageUploader
  
end
