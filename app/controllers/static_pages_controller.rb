class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, only: :findme

	def home
    @q = Findpost.search(params[:q])
    @results = @q.result.page(params[:page])
  end

  def findme
  	@user = current_user
  	@findpost = @user.findposts.build if signed_in?
    @findposts = @user.findposts.page(params[:page])
  end

  def search
    home
    render :home
  end

  def help
  end

  def about
  end

  def contact
  end
  
end
