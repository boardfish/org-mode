class HomeController < ApplicationController
  require_relative 'api_configs.rb'
  http_basic_authenticate_with name: Config::GITHUB[:username], 
                               password: Config::GITHUB[:password]
  def index
    require_relative 'trello_controller.rb'
    @links = Trello::List.find(Config::TRELLO[:links_list]).cards
  end
end
