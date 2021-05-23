class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable
         
  #画像 
  attachment :image
  
  # アソシエーション
   has_many :comments
   has_many :reports
   has_many :confirmations
   has_many :events       
  
end
