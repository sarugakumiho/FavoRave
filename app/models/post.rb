class Post < ApplicationRecord
  # ------------------------------------------------------------------------------------------------------------------
  # 投稿画像設定
  has_one_attached :image
  # ------------------------------------------------------------------------------------------------------------------
  # アソシエーション
  belongs_to :user
  # ------------------------------------------------------------------------------------------------------------------
  # バリデーション
  validates :star, numericality: { greater_than_or_equal_to: 1, message: 'は1以上を選択してください' }
  # ------------------------------------------------------------------------------------------------------------------
  # 投稿画像設定
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  # ------------------------------------------------------------------------------------------------------------------
end
