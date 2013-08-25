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
  end

  def edit
  end

  def update
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @user = User.find(params[:id])
    @user.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting"
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end