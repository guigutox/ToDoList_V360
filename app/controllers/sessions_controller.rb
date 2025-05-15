class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to todo_lists_path
    else
      flash.now[:alert] = "Usuário ou senha inválidos"
      render :new, status: :unprocessable_entity
    end
  end
  

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logout realizado com sucesso!"
  end
end
