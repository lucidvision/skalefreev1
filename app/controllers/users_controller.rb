class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_user,     only: [:index, :active]

	def show
    @user = User.find(params[:id])
    @user.profile ||= Profile.new
    @profile = @user.profile
    @findpost = @user.findposts.build if signed_in?
    @findposts = @user.findposts.page(params[:page]).per_page(4)
    @findpostsm = @user.findposts.all
    @forumpost = @user.forumposts.build if signed_in?
    @forumposts = @user.forumposts.page(params[:page]).per_page(10)

    respond_to do |format|
      format.html
      format.js
    end 
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

  def active
    @user = User.find(params[:id]).toggle(:active) 
    @user.save
    redirect_to users_path
  end

  private

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end