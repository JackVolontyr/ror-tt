class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy

  validates :title, :body, :user, presence: true

  scope :ordered_by_new, -> { order("created_at DESC") }
end
