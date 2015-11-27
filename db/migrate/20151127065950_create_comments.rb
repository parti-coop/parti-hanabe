class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :speech, index: true, null: false
      t.references :user, index: true, null: false
      t.text :body
      t.timestamps null: false
    end
  end
end
