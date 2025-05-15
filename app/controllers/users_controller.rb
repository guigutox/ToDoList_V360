class UsersController < ApplicationController

   def show
    @user = User.find(params[:id])
    flash.discard(:notice)
   end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to todo_lists_path, notice: "Usuário criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      session[:user_id] = nil
      redirect_to root_path, notice: "Usuário excluído com sucesso!"
    else
      redirect_to user_path(@user), alert: "Erro ao excluir o usuário."
    end
  end

  def update_password
    @user = current_user
  
    if @user.authenticate(params[:current_password])
      if params[:new_password] == params[:new_password_confirmation]
        if @user.update(password: params[:new_password])
          redirect_to user_path(@user), notice: "Senha atualizada com sucesso."
        else
          flash.now[:alert] = "Erro ao atualizar a senha."
          render :show , status: :unprocessable_entity
        end
      else
        flash.now[:alert] = "A nova senha e a confirmação não coincidem."
        render :show, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = "Senha atual incorreta."
      render :show, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
