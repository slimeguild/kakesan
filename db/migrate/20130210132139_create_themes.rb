class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.references :user
      t.string :title
      t.string :where
      t.string :who
      t.string :what
      t.text :description
      t.timestamps
    end
  end
end
