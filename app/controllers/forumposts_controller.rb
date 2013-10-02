class ForumpostsController < ApplicationController
  before_filter :authenticate_user!, except: :forum
  before_filter :correct_user,   only: :destroy

  def create
  	@forumpost = current_user.forumposts.build(params[:forumpost])
    if @forumpost.save
      flash[:success] = "Wallpost created!"
      redirect_to search_static_pages_path
    else
      flash[:error] = "Error creating your Wallpost!"
      redirect_to search_static_pages_path
    end
  end

  def destroy
  	@forumpost.destroy
    redirect_to root_path
  end

  def forum
    @user = current_user
    @forumpost = @user.forumposts.build if signed_in?
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

  private

    def correct_user
      @forumpost = current_user.forumposts.find_by_id(params[:id])
      redirect_to root_path if @forumpost.nil?
    end
end