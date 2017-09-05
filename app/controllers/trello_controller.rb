require 'trello'
require_relative 'api_configs'
Trello.configure do |config|
  config.developer_public_key = Config::TRELLO[:developer_public_key]
  config.member_token = Config::TRELLO[:member_token]
end

me = Trello::Member.find('undyingfish')
me.boards.each do |board|
  if board.name == "Personal"
    personal = Trello::Board.find(board.id)
    personal.lists.each do |list|
      if list.name == "Done"
        puts list.id
      end
    end
  end
  puts
end
