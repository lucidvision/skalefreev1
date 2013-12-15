class ForumpostsController < ApplicationController
  before_filter :authenticate_user!, except: :forum
  before_filter :correct_user,   only: :destroy

  def create
  	@forumpost = current_user.forumposts.build(params[:forumpost])
    if @forumpost.save
      redirect_to search_static_pages_path
    else
      redirect_to search_static_pages_path
    end
  end

  def destroy
  	@forumpost.destroy
    redirect_to wall_path
  end

  def forum
    @user = current_user
    @forumpost = @user.forumposts.build if signed_in?
    @comment = @user.forumposts.build if signed_in?
    @forumposts = @user.forumposts.page(params[:page]) if signed_in?
    @q = Forumpost.search(params[:q])
    @wall = @q.result(distinct: true).page(params[:page])
    @wallm = @q.result(distinct: true)

    respond_to do |format|
      format.mobile
      format.html 
      format.mobilejs
      format.js
    end 
  end

  def search
    forum
    render :forum
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @forumpost1 = Forumpost.find(params[:id])
    @forumpost1.add_or_update_evaluation(:votes, value, current_user)

    respond_to do |format|
      format.mobile {redirect_to :back}
      format.html {redirect_to :back}
      format.mobilejs
      format.js
    end 
  end

  private
    def correct_user
      @forumpost = current_user.forumposts.find_by_id(params[:id])
      redirect_to root_path if @forumpost.nil?
    end
end