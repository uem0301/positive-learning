class UsersController < ApplicationController
  def index
    if params[:follower]
      @relationships = Relationship.where(following_id: params[:user_id])
    elsif params[:following]
      @relationships = Relationship.where(follower_id: params[:user_id])
    end
  end

  def show
    @user = User.find params[:id]
    @collections = Collection.includes(:items).order('created_at DESC')
    @items = Item.order('created_at DESC')
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end