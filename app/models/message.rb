class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?  #ここのselfは、入力された内容自体を表している。（現在バリデーションかけている内容自体のこと。）
                          #self→バリデーションかけている内容自体  image.attached?→イメージファイルついてる？
  end
end
