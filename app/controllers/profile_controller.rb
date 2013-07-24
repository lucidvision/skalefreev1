class ProfileController < ApplicationController
	before_filter :authenticate_user!
  before_filter :correct_user,   only: :destroy

  def edit
  	@user = current_user
  	@profile = @user.profile
  end

  def update
  	@user = current_user
  	@profile = @user.profile
    if @profile.update_attributes(params[:profile])
      flash[:success] = "Profile Updated!"
      redirect_to @user
    else
      render edit_profile_path(@user)
    end
  end
end