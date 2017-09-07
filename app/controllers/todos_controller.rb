class TodosController < ApplicationController
  require_relative 'api_configs.rb'
  # http_basic_authenticate_with name: Config::GITHUB[:username], 
  #                              password: Config::GITHUB[:password]
  def index
    require_relative 'trello_controller.rb'
    require_relative 'github_controller.rb'
    @todos = todo_list.cards
    @issues = issues
    @events = events
  end

  def new
    @todo = Todo.new
  end

  def trello_delete
    require_relative 'trello_controller.rb'
    delete_card(params[:id])
    redirect_to todos_path
  end

  def trello_done
    require_relative 'trello_controller.rb'
    mark_done(params[:id])
    redirect_to todos_path
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.valid?
      require_relative 'trello_controller.rb'
      Trello::Card.create(
        name: @todo.title,
        desc: @todo.description,
        due: @todo.due.to_date,
        pos: 'top',
        list_id: Config::TRELLO[:todo_list]      
      )
      redirect_to todos_path
    else
      render 'new'
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to @todo
    else
      render 'edit'
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
   
    redirect_to todos_path
  end

  private
    def todo_params
      params.require(:todo).permit(:title, :description, :due)
    end
end
