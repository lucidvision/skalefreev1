class CommentsController < ApplicationController

	def create
		@comment = Comment.new(params[:comment])
		@comment.forumpost_id = params[:forumpost_id]
		@comment.user_id = current_user.id
    respond_to do |format|
    	if @comment.save
    		format.mobile
	      format.js
	      format.mobilejs
	      format.html
    	else
	      format.js
	      format.html
	      format.mobile
	      format.mobilejs
    	end
    end
	end

	def destroy
		@comment.destroy
    redirect_to wall_path
	end

end