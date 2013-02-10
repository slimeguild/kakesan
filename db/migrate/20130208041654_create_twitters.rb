class CreateTwitters < ActiveRecord::Migration
  def change
    create_table :twitters do |t|
      t.references :user
      t.string :account_id
      t.timestamps
    end
  end
end
