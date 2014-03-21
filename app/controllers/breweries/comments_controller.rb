#This controller handles the comments that are associated with the Breweries and are displayed on each breweries page.
class Breweries::CommentsController < ApplicationController
	def create
		@brewery = Brewery.find(params[:brewery_id])
		@comments = @brewery.comments

		@comment = current_user.comments.build(params[:comment])
		@comment.brewery = @brewery

		authorize! :create, @comment, message: "You need to be signed in to do that."
		if @comment.save
  		flash[:notice] = "Comment was saved successfully."
  		redirect_to @brewery
  	else
  		flash[:error] = "There was an error saving the comment. Please try again."
  		render 'breweries/show'
  	end
	end

	def destroy
		@brewery = Brewery.find(params[:brewery_id])
		@comment = @brewery.comments.find(params[:id])

		authorize! :destroy, @comment, message: "You need to own the comment to delete it."
		if @comment.destroy
			flash[:notice] = "Comment was removed."
			redirect_to @brewery
		else
			flash[:error] = "Comment couldn't be deleted. Try again."
			redirect_to @brewery
		end
	end
end
