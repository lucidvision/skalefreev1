class ProfileController < ApplicationController
	before_filter :authenticate_user!
  before_filter :correct_user,   only: [:edit]

  def edit
  	@user = current_user
    @user.profile ||= Profile.new
  	@profile = @user.profile
  end

  def update
  	@user = current_user
    @user.profile ||= Profile.new
  	@profile = @user.profile
    if @profile.update_attributes(params[:profile])
      flash[:success] = "Profile Updated!"
      redirect_to @user
    else
      flash[:error] = "Sorry, we couldn't save your changes."
      redirect_to edit_profile_path(@user)
    end
  end

  private 

  def correct_user
    @cuser = User.find(params[:id])
    redirect_to edit_profile_path(current_user) unless current_user == @cuser
  end
end

