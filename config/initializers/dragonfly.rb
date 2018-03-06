require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "16ba2d357fdd7311a2dbf8708122b25705e6faf996bcc81981208cb2187fc2b3"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
ActiveSupport.on_load(:active_record) do
  extend Dragonfly::Model
  extend Dragonfly::Model::Validations
end
