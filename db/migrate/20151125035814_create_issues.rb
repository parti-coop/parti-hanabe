class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title, length: 500, null: false
      t.references :user, null: false, index: true
      t.timestamps null: false
    end
  end
end
