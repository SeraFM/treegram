class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.valid?
    if !@user.is_email?
      flash[:alert] = "Input a properly formatted email."
      redirect_to :back
    elsif @user.errors.messages[:email] != nil
      flash[:notice]= "That email " + @user.errors.messages[:email].first
      redirect_to :back
    elsif @user.save
      flash[:notice]= "Signup successful. Welcome to the site!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  def new
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @tag = Tag.new
    @comment = Comment.new
    @follows = Follow.all    
    @following_array = Array.new
    @sorted_photos_array = Array.new
    @photos = Array.new
    for f in @follows do
      if f.follower == @user.id
        if !(@following_array.include? User.find(f.followee))
          @following_array.push(User.find(f.followee))
          @photos.push(Photo.where(:user_id => f.followee))
        end
      end
    end

    for list in @photos do
      for photo in list do
        @sorted_photos_array.push(photo)
      end
    end
    @sorted_photos_array = @sorted_photos_array.sort_by(&:created_at).reverse
  end

  def destroy
    Photo.find(params[:id]).destroy
    flash[:notice] = "Successfully deleted photo"
    redirect_to :back
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
  end

end
