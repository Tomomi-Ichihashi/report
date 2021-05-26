class Department < ApplicationRecord
  
  # アソシエーション
   has_many :users
   
  # バリデーション 
  validates :name, presence: true
   
end
