#This controller handles the comments that are associated with the Breweries and are displayed on each breweries page.
class Beers::CommentsController < ApplicationController
	def create
		@beer = Beer.find(params[:beer_id])
		@comments = @beer.comments

		@comment = current_user.comments.build(params[:comment])
		@comment.beer = @beer

		authorize! :create, @comment, message: "You need to be signed in to do that."
		if @comment.save
  		flash[:notice] = "Comment was saved successfully."
  		redirect_to @beer
  	else
  		flash[:error] = "There was an error saving the comment. Please try again."
  		render 'beers/show'
  	end
	end

	def destroy
		@beer = Beer.find(params[:beer_id])
		@comment = @beer.comments.find(params[:id])

		authorize! :destroy, @comment, message: "You need to own the comment to delete it."
		if @comment.destroy
			flash[:notice] = "Comment was removed."
			redirect_to @beer
		else
			flash[:error] = "Comment couldn't be deleted. Try again."
			redirect_to @beer
		end
	end
end
