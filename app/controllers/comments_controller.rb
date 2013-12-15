class CommentsController < ApplicationController

	def create
		@comment = Comment.new(params[:comment])
		@comment.forumpost_id = params[:forumpost_id]
		@comment.user_id = current_user.id
    if @comment.save
      redirect_to search_static_pages_path
    else
      redirect_to search_static_pages_path
    end
	end

	def destroy
		@comment.destroy
    redirect_to wall_path
	end

end