class Client < ApplicationRecord
  
  # アソシエーション
  has_many :comments
  has_many :reports
  
  
end
