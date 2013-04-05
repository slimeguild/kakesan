class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.references :theme
      t.string :title
      t.timestamps
    end
  end
end
