class Users::CommentsController < ApplicationController
  
  def create
    @client = Client.find(params[:client_id])
    # 取引先に紐ついた引き継ぎコメントを作成
    @comment = @client.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @client = Client.find(params[:client_id])
    render :index
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body, :client_id, :user_id)
  end
  
end
