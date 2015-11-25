class AddLikeCountToSpeeches < ActiveRecord::Migration
  def change
    add_column :speeches, :like_count, :integer, default: 0, null: false
  end
end
