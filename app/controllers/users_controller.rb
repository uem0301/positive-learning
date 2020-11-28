class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :following, :followers]

  def index
    if params[:follower]
      @relationships = Relationship.where(following_id: params[:user_id])
    elsif params[:following]
      @relationships = Relationship.where(follower_id: params[:user_id])
    end
  end

  def show
    @collections = Collection.includes(:items).order('created_at DESC')
    @items = Item.order('created_at DESC')
    @favorite_items = @user.favorite_items
  end

  def following
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @users = @user.followers
    render 'show_follower'
  end

  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_user_path(current_user)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.fetch(:user, {}).permit(:name, :email, :password)
  end
end
