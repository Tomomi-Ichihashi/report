class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable
         
  #画像 
  attachment :image
  
  # アソシエーション
   has_many :comments
   has_many :items
   has_many :checks
   has_many :events
   belongs_to :department
   
  #バリデーション
  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :postal_code
    validates :address
    validates :telephone_number
  end
    
end