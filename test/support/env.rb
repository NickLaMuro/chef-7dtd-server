kitchen_attributes = File.expand_path(File.join(__FILE__, '..', '..', '..', 'kitchen_attributes.local.yml'))

if kitchen_attributes and File.exists?(kitchen_attributes)
  # Steam Credentials
  steam_creds = YAML.load_file(kitchen_attributes).fetch('steam', {})
  ENV['STEAM_USERNAME'] ||= steam_creds['username']
  ENV['STEAM_PASSWORD'] ||= steam_creds['password']
end

unless ENV['RECIPES']
  ENV['RECIPES'] = "recipe[7dtd-server::default],recipe[7dtd-server::backup]"
else
  # strip out any of the standard chef syntax so we can add it ourselves safely
  recipes = ENV['RECIPES'].gsub(/(recipe|\[|\]|7dtd-server|:)/, '').split(',')
  ENV['RECIPES'] = recipes.map { |recipe| "recipe[7dtd-server::#{recipe}]" }.join(',')
end
