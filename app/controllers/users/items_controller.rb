class Users::ItemsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item), notice: "You have created report successfully."
    else
      @item = Item.all
      render 'index'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
   @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item), notice: "You have updated report successfully."
    else
      render 'edit'
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to user_path(@item.user_id)
  end
  
  private
  
  def item_params
    params.require(:item).permit(:user_id, :client_id, :body, :start_visit, :finish_visit)
  end
end
