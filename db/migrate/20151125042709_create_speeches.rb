class CreateSpeeches < ActiveRecord::Migration
  def change
    create_table :speeches do |t|
      t.string :title, length: 500, null: false
      t.text :body
      t.integer :position, null: false
      t.references :user, null: false, index: true
      t.references :issue, null: false, index: true
      t.timestamps null: false
    end
  end
end
