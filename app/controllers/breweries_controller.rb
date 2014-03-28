#This handles looking up the brewery and displaying it on each breweries page. As well as displaying its comments.
class BreweriesController < ApplicationController
  def show
  	@posts = Post.all
  	@brewery = Brewery.find(params[:id])
  	@beers = @brewery.beers
    @comment = Comment.new
    @comments = @brewery.comments
  end
end
