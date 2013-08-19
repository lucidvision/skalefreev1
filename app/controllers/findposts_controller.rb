class FindpostsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user,   only: :destroy

  def create
    @findpost = current_user.findposts.build(params[:findpost])
    if @findpost.save
      flash[:success] = "Findpost created!"
      redirect_to findme_path
    else
      flash[:error] = "Error creating your findpost! You need at least a subject skale."
      redirect_to findme_path
    end
  end

  def destroy
    @findpost.destroy
    redirect_to findme_path
  end

  private

    def correct_user
      @findpost = current_user.findposts.find_by_id(params[:id])
      redirect_to findme_path if @findpost.nil?
    end
end