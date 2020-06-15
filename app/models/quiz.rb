class Quiz < ApplicationRecord
  validates :text, presence: true, length: { maximum: 60 }
  validates :answer, presence: true, format: { with: /\A[ぁ-ん０-９ー－]+\z/ }

  belongs_to :user
  has_many :correctnesses
end
