class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comments = @post.comments

		@comment = current_user.comments.build(params[:comment])
		@comment.post = @post

		authorize! :create, @comment, message: "You need to be signed in to do that."
		if @comment.save
  		flash[:notice] = "Comment was saved successfully."
  		redirect_to @post
  	else
  		flash[:error] = "There was an error saving the comment. Please try again."
  		render 'posts/show'
  	end
	end
end
