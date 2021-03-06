class UsersController < ApplicationController
  before_action only: [:index, :edit, :update, :destroy,
                                        :following, :followers]


  def show
    @users = User.all.page(params[:page] || 1).per 2
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page] || 1).per 6
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page] || 1).per 6
    render 'show_follow'
  end
end