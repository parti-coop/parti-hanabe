class Issue < ActiveRecord::Base
  belongs_to :user
  has_many :speeches

  def best_speeches
    Hash[Speech.positions_i18n.map { |k, v|[k, [v, speeches.by_position(k).best]]}]
  end
end
