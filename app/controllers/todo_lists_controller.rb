class TodoListsController < ApplicationController
    before_action :require_login
    helper_method :current_user
    before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def index
        @todo_lists = current_user&.todo_lists&.order(created_at: :desc) || []

      end
      

    def show
        @todo_list = TodoList.find(params[:id])
    
        @todo_items = @todo_list.todo_items.sort_by do |item|
          case item.priority
          when 'alta' then 0
          when 'media' then 1
          when 'baixa' then 2
          else 3
          end
        end
    end


    def new
        @todo_list = TodoList.new
    end

    def create
        @todo_list = current_user.todo_lists.build(todo_list_params)
      
        if @todo_list.save
          redirect_to @todo_list, notice: 'Todo list criada com sucesso.'
        else
          render :new, status: :unprocessable_entity
        end
      end

    def edit
    end

    def update
      if @todo_list.update(todo_list_params)
          redirect_to @todo_list, notice: 'Todo list foi atualizada com sucesso.'
      else
          render :edit, status: :unprocessable_entity
      end
  end
      

  def destroy
    @todo_list = TodoList.find(params[:id])
    @todo_list.destroy
    redirect_to todo_lists_path, notice: "Lista excluída com sucesso."
  end
      

    private
    def set_todo_list
        @todo_list = current_user.todo_lists.find(params[:id])
    end
      

    def todo_list_params
        params.require(:todo_list).permit(:title, :description)
    end


    

end
