class Item < ApplicationRecord
  
  # アソシエーション
  belongs_to :user
  belongs_to :client
  has_many :checks
  
  #バリデーション
  with_options presence: true do
    validates :client_id
    validates :body
    validates :start_visit
    validates :finish_visit
  end
  
  # 他のユーザーがレポートを確認したかどうかの判定メソッド
  def checked_by?(user)
    checks.where(user_id: user.id).exists?
  end
  
end
