class Question < ApplicationRecord
  validates :title, :body, :user, presence: true

  belongs_to :user

  scope :ordered_by_new, -> { order("created_at DESC") }
end
