class Department < ApplicationRecord
  
  # アソシエーション
   has_many :users
   
end
