class ChatsController < ApplicationController

  def show
    @chat = Chat.find(params[:id])

  end

  def index
    @chats = Chat.all.order(created_at: :desc)
  end

  def chats_list

    if params[:search]
      @chats = Chat.where("title LIKE ?","%#{params[:search]}%")
    else
      @chats = Chat.all
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @chat = Chat.find(params[:id])
  end

  def new
    @chat = Chat.new
  end

  def create
    user = current_user
    profile = user.profile
    @chat = profile.chats.build(chat_params)
    @chat.user_id = user.id
    if @chat.save
      redirect_to profile_path(profile)
    end
  end

  def chat_params
    params.require(:chat).permit(:title, :description)
  end
end
