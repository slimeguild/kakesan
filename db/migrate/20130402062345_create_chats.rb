class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.references :talk
      t.references :user
      t.text :message
      t.timestamps
    end
  end
end
