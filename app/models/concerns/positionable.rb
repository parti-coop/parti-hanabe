module Positionable
  extend ActiveSupport::Concern

  included do
    enum position: {in_favor: 1, conditionally_in_favor:2, conditionally_opposed: 3, opposed: 4}
  end

  def position_i18n
    I18n.t self.position, scope: 'enums.positions'
  end

  class_methods do
    def positions_i18n
      Hash[positions.map { |k,v| [k, I18n.t(:"enums.positions.#{k}")]}]
    end
  end
end
