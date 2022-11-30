class FollowsController < ApplicationController
    
    def index
        @users_no_current = User.where.not(id: current_user)
        @user = current_user
        @following_users = Follow.where(follower: current_user)
        @following_ids = Array.new
        @users_to_follow = Array.new

        for follow in @following_users do
            @following_ids.push(follow.followee)
        end

        for user in @users_no_current do
            if !(@following_ids.include?(user.id))
                @users_to_follow.push(user)
            end
        end
    end

    def create
        @followee = User.find(params[:followee])
        @follow = Follow.create(follower: params[:user_id], followee: params[:followee])
        flash[:notice] = "Successfuly followed #{@followee.email}"
        redirect_to :back
    end
    
    private
    def follow_params
      params.require(:follow).permit(:follower, :followee)
    end

end
