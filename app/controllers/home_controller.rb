class HomeController < ApplicationController
  def index
    require_relative 'trello_controller.rb'
    @links = Trello::List.find(Config::TRELLO[:links_list]).cards
  end
end
