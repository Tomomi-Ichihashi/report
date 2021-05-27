class Admins::UsersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admins_user_path(@user), notice: "＊新規登録が完了しました＊"
    else
      render 'new'
    end  
  end

  def index
    @users = User.all.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admins_user_path(@user), notice: "＊情報が更新されました＊"
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
      :email,
      :password,
      :password_confirmation,
      :is_active,
      :image,
      :department_id
    )
  end
  
end
