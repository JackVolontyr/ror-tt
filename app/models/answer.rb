class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :attachments, as: :attachmentable, dependent: :destroy

  validates :body, :question, :user, presence: true

  accepts_nested_attributes_for :attachments, allow_destroy: true
end
