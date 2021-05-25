class Item < ApplicationRecord
  
  # アソシエーション
  belongs_to :user
  belongs_to :client
  has_many :checks
  
  # バリデーション 
  validates :body, presence: true
  
  # 他のユーザーがレポートを確認したかどうかの判定メソッド
  def checked_by?(user)
    checks.where(user_id: user.id).exists?
  end
  
end
