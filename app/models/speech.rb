class Speech < ActiveRecord::Base
  include Positionable

  belongs_to :issue
  belongs_to :user
  has_many :likes
  has_many :comments

  scope :by_position, -> (position) { send(position) }
  scope :best, -> { order(like_count: :desc).order(created_at: :desc).first }

  def liked_by user
    return false if user.nil?

    likes.where(user: user).exists?
  end
end
