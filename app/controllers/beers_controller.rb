class BeersController < ApplicationController
	def show
		@beer = Beer.find(params[:id])
		@beers = Beer.all



		@comment = Comment.new
    @comments = @beer.comments
	end
end
