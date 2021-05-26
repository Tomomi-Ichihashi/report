class Users::ClientsController < ApplicationController
  
  before_action :authenticate_user!
  
  def new
    @client = Client.new
  end
  
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to client_path(@client), notice: "You have created client successfully."
    else
      @clients = Client.all
      render 'index'
    end  
  end

  def index
    @clients = Client.all
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
      redirect_to client_path(@client), notice: "You have updated client successfully."
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
