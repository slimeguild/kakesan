class CreateAges < ActiveRecord::Migration
  def change
    create_table :ages do |t|
      t.string :name
      t.timestamps
    end
    YAML.load_file('db/data/ages.yml').each{|age| Age.create!(age)} 
  end
end
