class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :attachments, as: :attachmentable, dependent: :destroy

  validates :title, :body, :user, presence: true

  scope :ordered_by_new, -> { order("created_at DESC") }

  accepts_nested_attributes_for :attachments, allow_destroy: true
end
