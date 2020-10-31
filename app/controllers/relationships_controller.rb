class RelationshipsController < ApplicationController
    def create
        @user = User.find(params[:following_id])
        current_user.follow(@user)
        @follower = @user.followers.count
    end

    def destroy
        @user = User.find(params[:id])
        current_user.unfollow(@user)
        @follower = @user.following.count
    end
end
