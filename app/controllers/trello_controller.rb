require 'trello'

Trello.configure do |config|
  config.developer_public_key = Config::TRELLO[:developer_public_key]
  config.member_token = Config::TRELLO[:member_token]
end

def todo_list
  require_relative 'api_configs.rb'
  Trello::List.find(Config::TRELLO[:todo_list])
end

def delete_card(id)
  @todo = Trello::Card.find(id)
  @todo.delete
end

def mark_done(id)
  @todo = Trello::Card.find(id)
  @todo.move_to_list(Trello::List.find(Config::TRELLO[:done_list]))
end

