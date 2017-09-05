require 'trello'
require_relative 'api_configs'
Trello.configure do |config|
  config.developer_public_key = Config::TRELLO[:developer_public_key]
  config.member_token = Config::TRELLO[:member_token]
end

