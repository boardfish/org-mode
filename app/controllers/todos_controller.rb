class TodosController < ApplicationController
  require_relative 'api_configs.rb'
  # http_basic_authenticate_with name: Config::GITHUB[:username], 
  #                              password: Config::GITHUB[:password]
  def index
    require_relative 'api_configs.rb'
    require_relative 'github_controller.rb'
    @links = []
    @todos = todo_list.node.cards.edges
    @issues = issues
    @events = []
    @repos = repos
  end
end
