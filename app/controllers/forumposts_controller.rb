class ForumpostsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user,   only: :destroy

  def create
  	@forumpost = current_user.forumposts.build(params[:forumpost])
    if @forumpost.save
      flash[:success] = "Wallpost created!"
      redirect_to root_path
    else
      flash[:error] = "Error creating your Wallpost!"
      redirect_to root_path
    end
  end

  def destroy
  	@forumpost.destroy
    redirect_to root_path
  end

  private

    def correct_user
      @forumpost = current_user.forumposts.find_by_id(params[:id])
      redirect_to root_path if @forumpost.nil?
    end
end