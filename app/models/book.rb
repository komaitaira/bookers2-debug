class Book < ApplicationRecord
	belongs_to :user, dependent: :destroy
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	has_many :favorites, dependent: :destroy
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def favorited_by?(user)
	  favorites.where(user_id: user.id).exists?
	end
end
