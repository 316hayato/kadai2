class Book < ApplicationRecord
  validates :title, presence: true # title用バリデーション
  validates :body, presence: true　# body用バリデーション
end
