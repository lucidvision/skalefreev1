class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, only: :findme

	def home
    @user = current_user
    @forumpost = @user.forumposts.build if signed_in?
    @forumposts = @user.forumposts.page(params[:page]) if signed_in?
    @q = Forumpost.search(params[:q])
    @wall = @q.result(distinct: true).page(params[:page])

    respond_to do |format|
      format.html 
      format.mobilejs
      format.js
    end 
  end

  def search
    home
    render :home
  end

  def findpost_help
  end

  def wallpost_help
  end

  def about
  end

  def contact
  end
  
end
