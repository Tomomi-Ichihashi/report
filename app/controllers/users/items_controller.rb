class Users::ItemsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @items = Item.all.order(created_at: :DESC).page(params[:page]).per(15)
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item), notice: "＊報告を作成しました＊"
    else
      render 'new'
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
      redirect_to item_path(@item), notice: "＊報告を更新しました＊"
    else
      render 'edit'
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path, notice: "＊報告を削除しました＊"
  end
  
  private
  
  def item_params
    params.require(:item).permit(:user_id, :client_id, :body, :start_visit, :finish_visit)
  end
end
