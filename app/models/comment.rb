class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :speech

  default_scope { order(created_at: :desc)}
end
