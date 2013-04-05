class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.references :theme
      t.references :user
      t.timestamps
    end
  end
end
