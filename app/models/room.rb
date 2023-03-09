class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations

  mount_uploader :hotel_image, ImageUploader

  #  ransackで検索許可を出すカラム
  #  def self.ransackable_attributes(auth_object = nil)
  #    ["address", "hotel_detail", "hotel_name"]
  #  end

  # キーワード検索(施設名、施設情報)
  def self.keyword_search(keyword_search)
    return unless keyword_search != ''

    Room.where(['hotel_name like? OR hotel_detail like?', "%#{keyword_search}%", "%#{keyword_search}%"])
  end

  # エリア検索
  def self.area_search(area_search)
    return unless area_search != ''

    Room.where('address like?', "%#{area_search}%")
  end
end
