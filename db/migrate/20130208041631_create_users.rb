class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :gender
      t.references :age
      t.string :nickname
      t.string :twitter_image
      t.string :area
      t.text :description
      t.timestamps
    end
  end
end