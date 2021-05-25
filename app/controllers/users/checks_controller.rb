class Users::ChecksController < 
  
  def create
    @information = Information.find(params[:information_id])
    # confirmation.user_id = current_user.idが済んだ状態で生成
    check = current_user.checks.build(information_id: params[:information_id])
    check.save
  end

  def destroy
    @information = Information.find(params[:information_id])
    check = current_user.checks.find_by(information_id: params[:information_id])
    check.destroy
  end
  
end
