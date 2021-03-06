class Users::ClientsController < ApplicationController
  
  before_action :authenticate_user!
  
  def new
    @client = Client.new
  end
  
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to client_path(@client), notice: "＊取引先を登録しました＊"
    else
      render 'new'
    end  
  end

  def index
    @clients = Client.all.page(params[:page]).per(15)
  end

  def show
    @client = Client.find(params[:id])
    @comment = Comment.new
    @comments = @client.comments.order(created_at: :DESC)
  end

  def edit
    @client = Client.find(params[:id])
  end
  
  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to client_path(@client), notice: "＊取引先の情報を更新しました＊"
    else
      render "edit"
    end
  end
  
  private
  
  def client_params
    params.require(:client).permit(
      :name,
      :name_kana,
      :postal_code,
      :address,
      :telephone_number,
      :email
    )
  end
  
end
