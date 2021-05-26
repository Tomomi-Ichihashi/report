class Client < ApplicationRecord
  
  # アソシエーション
  has_many :comments
  has_many :items
  
  #バリデーション
  with_options presence: true do
    validates :name
    validates :name_kana
    validates :postal_code
    validates :address
    validates :telephone_number
  end
  
end