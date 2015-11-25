class Speech < ActiveRecord::Base
  include Positionable

  belongs_to :issue
  belongs_to :user

  scope :by_position, -> (position) { send(position) }
  scope :best, -> { order(like_count: :desc).order(created_at: :desc).first }
end
