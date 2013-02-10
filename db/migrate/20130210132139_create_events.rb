class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user
      t.string :where
      t.string :who
      t.string :what
      t.text :description
      t.timestamps
    end
  end
end
