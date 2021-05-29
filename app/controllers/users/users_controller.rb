class Users::UsersController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @users = User.where(is_active: true).page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @users = User.where(department_id: @user.department.id, is_active: true)
    @events = Event.where(user_id: @user.id)
    @event = Event.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "＊情報を更新しました＊"
    else
      render "edit"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :postal_code,
      :address,
      :telephone_number,
      :password,
      :password_confirmation
    )
  end
  
end
