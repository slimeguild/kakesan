class CreateGenders < ActiveRecord::Migration
  def change
    create_table :genders do |t|
      t.string :name
      t.timestamps
    end
    YAML.load_file('db/data/genders.yml').each{|gender| Gender.create!(gender)}
  end
end
