class AddTitleToEvents < ActiveRecord::Migration
  def up
    add_column :events, :title, :string
    Event.all.each{|event| event.destroy}
  end
  
  def down
    remove_column :events, :title
  end
end
