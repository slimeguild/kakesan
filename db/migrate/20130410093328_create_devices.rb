class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.references :user
      t.string :token
      t.string :type
      t.timestamps
    end
    User.all.each do |u|
      IOS.create!({user_id: u.id})
    end
  end
end
