class Carriage < ApplicationRecord
  belongs_to :train, optional: true

  validates :number, :bottom_seats, presence: true
  validates_presence_of :top_seats, unless: :luxury_or_seat?
  validates_uniqueness_of :number

  before_create :set_position
  before_update :set_position

  scope :ordered_by_head, -> { group(:position, :id).order("position") }
  scope :ordered_by_tail, -> { group(:position, :id).order("position DESC") }

  protected

  def set_position
    current_train.present? ? filter_uniq : unset_position
  end

  def filter_uniq
    (carriages_count + 1).times do |i|
      if position_uniq?(i + 1)
        self[:position] = i + 1
        break
      end
    end
  end

  def unset_position
    self[:position] = nil
  end

  def position_uniq?(new_position)
    Carriage.group(:position, :id).where(train: train_id).map(&:position).exclude? new_position
  end

  def luxury_or_seat?
    self.class.name == 'CarriageLuxury' || self.class.name == 'CarriageSeat'
  end

  def current_train
    Train.find_by id: train_id
  end

  def carriages_count
    current_train.carriages.count
  end
end
