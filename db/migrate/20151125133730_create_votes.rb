class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :position, null: false
      t.references :user, null: false, index: true
      t.references :issue, null: false, index: true
      t.timestamps null: false
    end
  end
end
