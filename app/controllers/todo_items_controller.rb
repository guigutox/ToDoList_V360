class TodoItemsController < ApplicationController
    before_action :set_todo_list
    before_action :set_todo_item, only: [:edit, :update, :destroy]


    def new 
        @todo_item = @todo_list.todo_items.build
    end

    def create
        @todo_item = @todo_list.todo_items.build(todo_item_params)

        if @todo_item.save
            redirect_to @todo_list, notice: 'Todo item was successfully created.'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end


    def update
        if @todo_item.update(todo_item_params)
            redirect_to @todo_list, notice: 'Todo item was successfully updated.'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @todo_item.destroy
        redirect_to @todo_list, notice: 'Todo item was successfully destroyed.'
    end

    def toggle_done
        @todo_item = @todo_list.todo_items.find(params[:id])
        @todo_item.update(done: !@todo_item.done)
        redirect_to @todo_list, notice: "Estado da tarefa atualizado com sucesso."
    end
      

    def set_todo_list
        @todo_list = TodoList.find(params[:todo_list_id])
      end
    
    def set_todo_item
        @todo_item = @todo_list.todo_items.find(params[:id])
    end
    
    def todo_item_params
        params.require(:todo_item).permit(:content, :done)
    end

end
