class Comment < ApplicationRecord
  
  # アソシエーション
  belongs_to :user
  belongs_to :client
  
  # バリデーション 
  validates :body, presence: true
  
end
