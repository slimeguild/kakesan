YAML.load_file('db/data/dummy/users.yml').each{|user| User.create!(user)}
YAML.load_file('db/data/dummy/events.yml').each{|event| Event.create!(event)}
YAML.load_file('db/data/dummy/entries.yml').each{|entry| Entry.create!(entry)}
