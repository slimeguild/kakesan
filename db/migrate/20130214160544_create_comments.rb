class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :event
      t.text       :body
      t.timestamps
    end
  end
end
