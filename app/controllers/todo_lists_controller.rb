class TodoListsController < ApplicationController
    before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

    def index
        @todo_lists = TodoList.all
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
        @todo_list = TodoList.new(todo_list_params)

        if @todo_list.save
            redirect_to @todo_list, notice: 'Todo list was successfully created.'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @todo_list.update(todo_list_params)
            redirect_to @todo_list, notice: 'Todo list was successfully updated.'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @todo_list = TodoList.find(params[:id])
        @todo_list.destroy
        redirect_to root_path, notice: 'Todo list was successfully destroyed.'
    end
      

    private
    def set_todo_list
        @todo_list = TodoList.find(params[:id])
    end

    def todo_list_params
        params.require(:todo_list).permit(:title)
    end


    

end
