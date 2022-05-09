class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params) 
      #current_user.update(user_params) を処理し、updateできれば真・できなければ偽の処理を行う
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
