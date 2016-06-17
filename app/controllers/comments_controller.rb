class CommentsController < ApplicationController



  def create
    @profile = current_user.profile
    @chat = Chat.find(params[:chat_id])
    @comment = @chat.comments.build(comment_params)
    @comment.profile_id = @profile.id
    if @comment.save
      redirect_to chat_path(@chat)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @chat = @comment.chat
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
