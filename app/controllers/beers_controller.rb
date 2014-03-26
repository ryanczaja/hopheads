class BeersController < ApplicationController
	def show
		@beer = Beer.find(params[:id])
		@comment = Comment.new
    @comments = @beer.comments
	end
end
