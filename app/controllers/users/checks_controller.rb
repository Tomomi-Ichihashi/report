class Users::ChecksController < ApplicationController
  
  def create
    @item = Item.find(params[:item_id])
    # confirmation.user_id = current_user.idが済んだ状態で生成
    check = current_user.checks.build(item_id: params[:item_id])
    check.save
  end

  def destroy
    @item = Item.find(params[:item_id])
    check = current_user.checks.find_by(item_id: params[:item_id])
    check.destroy
  end
  
end
