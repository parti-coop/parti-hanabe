class Like < ActiveRecord::Base
  belongs_to :speech
  belongs_to :user
end
