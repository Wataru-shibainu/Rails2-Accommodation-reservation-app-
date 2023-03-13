class User < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  validates :name, presence: { message: 'は入力必須項目です' }
  # validates :email, presence: { message: 'メールアドレスは入力必須項目です' }
  # validates :password, presence: { message: 'パスワードは入力必須項目です' }
  # validates :password_confirmation, presence: { message: '確認用パスワードは入力必須項目です' }
end
