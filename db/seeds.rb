YAML.load_file('db/data/dummy/users.yml').each{|user| User.create!(user)}
YAML.load_file('db/data/dummy/themes.yml').each{|theme| Theme.create!(theme)}
YAML.load_file('db/data/dummy/entries.yml').each{|entry| Entry.create!(entry)}
