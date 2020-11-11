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
    redirect_to root_path
  end
end
