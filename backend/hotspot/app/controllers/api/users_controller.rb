class Api::UsersController < ApplicationController

  IMAGES = [
    "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar.png",
    "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-1.png",
    "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-2.png",
    "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-3.png",
    "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-4.png",
    "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-5.png",
    "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-6.png",
    "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-7.png",
    "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-8.png",
    "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-9.png",
    "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-0.png",
    "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-11.png",
    "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-12.png",
    "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-13.png",
    "https://raw.githubusercontent.com/milesmcleod/purplenote-images/master/avatar_images/avatar-14.png",
  ]

  def show
    @user = User.find(params[:id])
    render :show
  end

  def create
    @user = User.new(user_params)
    @user.img_url = IMAGES.sample
    idx = @user.email.index('@')
    if idx.nil?
      render json: ["Invalid email address"], status: 422
      return
    end
    @user.username = @user.email.dup[0...idx]
    if @user.save
      @queue = List.new(
        title: "Queue",
        owner_id: @user.id,
        queue_boolean: true
      )
      @queue.save
      login(@user)
      render 'api/session/show'
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :img_url)
  end
end
