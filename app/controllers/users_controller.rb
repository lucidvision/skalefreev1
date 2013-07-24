class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user,   only: [:edit, :update]

	def show
    @user = User.find(params[:id])
    @user.profile ||= Profile.new
    @profile = @user.profile
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Name/Password Updated!"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end