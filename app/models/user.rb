class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image, destroy: false
  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50}
end
