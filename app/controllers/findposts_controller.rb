class FindpostsController < ApplicationController
  before_filter :authenticate_user!, except: :findyou
  before_filter :correct_user,   only: :destroy

  def create
    @findpost = current_user.findposts.build(params[:findpost])
    if @findpost.save
      flash[:success] = "Findpost created!"
      redirect_to findyou_path
    else
      flash[:error] = "Error creating your Findpost! You need at least a subject or your criteria was too long."
      redirect_to findyou_path
    end
  end

  def findyou
    @q = Findpost.search(params[:q])
    @results = @q.result.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end 
  end

  def search
    findyou
    render :findyou
  end

  def findme
    @user = current_user
    @findpost = @user.findposts.build if signed_in?
    @findposts = @user.findposts.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end 
  end

  def destroy
    @findpost.destroy
    redirect_to findyou_path
  end

  def popup
    @post = current_user.findposts.build(params[:findpost])
    respond_to do |format|
      format.js
    end
  end

  private

    def correct_user
      @findpost = current_user.findposts.find_by_id(params[:id])
      redirect_to findme_path if @findpost.nil?
    end
end