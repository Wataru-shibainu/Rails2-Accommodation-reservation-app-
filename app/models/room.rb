class Room < ApplicationRecord
  
  belongs_to :user
  
  mount_uploader :hotel_image, ImageUploader
  
  def self.ransackable_attributes(auth_object = nil)
    ["address", "hotel_detail", "hotel_name"]
  end
  
end
