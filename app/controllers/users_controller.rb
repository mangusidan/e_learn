class UsersController < ApplicationController
  include UsersHelper
  before_action :set_user, only: [:show, :update, :destroy,:follow ,:unfollow]
  
  def show;end

  def index
    @users = User.all.page(params[:page]).per(3)
  end

  def update
    @user = current_user
    if @user.update(user_params)
      render root_path
    else
      render edit
    end
  end

  def follow
    @user = User.find(params[:id])
      Relationship.create_or_find_by(follower_id: current_user.id, followee_id: @user.id)
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace(dom_id_for_follower(@user),
                                partial: 'users/follow_button',
                                locals: { user: @user }),
            turbo_stream.update("#{@user.id}-follower-count",
                                partial: 'users/follower_count',
                                locals: { user: @user })
          ]
        end
        format.json { render json: @user.posts }
        format.html { redirect_to @user, notice: 'Follow Successfully'}
      end
  end
    
  def unfollow
    current_user.followed_users.where(follower_id: current_user.id, followee_id: @user.id).destroy_all
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace(dom_id_for_follower(@user),
                               partial: 'users/follow_button',
                               locals: { user: @user }),
          turbo_stream.update("#{user.id}-follower-count",
                              partial: 'users/follower_count',
                              locals: { user: @user })
        ]
      end
      format.html { redirect_to @user, notice: 'Unfollow Successfully.' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :avatar)  
  end

  def set_user
    @user = User.find(params[:id])
  end
end
