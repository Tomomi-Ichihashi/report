class Event < ApplicationRecord
  
  # アソシエーション
  belongs_to :user
  
  #バリデーション
  with_options presence: true do
    validates :title
    validates :start
    validates :end
  end
  
end
