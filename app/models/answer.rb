class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :body, :question, :user, presence: true
end
