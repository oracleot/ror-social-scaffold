class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def invite_friend
    user = User.find(params[:id])
    Friendship.create(user_id: current_user.id, friend_id: user.id, status_confirm: false)
    redirect_to root_path, notice: 'Friendship invite sent'
  end

  def confirm_friend
    user = User.find(params[:id])
    current_user.confirm_friend(user)
    redirect_to user, notice: 'Accepted friend request'
  end
end
