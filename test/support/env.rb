kitchen_attributes = File.expand_path(File.join(__FILE__, '..', '..', '..', 'kitchen_attributes.local.yml'))

if kitchen_attributes and File.exists?(kitchen_attributes)
  # Steam Credentials
  steam_creds = YAML.load_file(kitchen_attributes).fetch('steam', {})
  ENV['STEAM_USERNAME'] ||= steam_creds['username']
  ENV['STEAM_PASSWORD'] ||= steam_creds['password']
end
