class Issue < ActiveRecord::Base
  belongs_to :user
  has_many :speeches
  has_many :votes

  def best_speeches
    Hash[Speech.positions_i18n.map { |k, v|[k, {name: v, best_speech: speeches.by_position(k).best}]}]
  end

  def stat_votes
    Hash[Speech.positions_i18n.map { |k, v|[k, {name: v, count: votes.by_position(k).count}]}]
  end
end
