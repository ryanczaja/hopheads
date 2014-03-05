# new model for beer_descriptions, belong_to beer (okay)
# beer validate unique name (okay)
# beer index name 

class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
  	@post = Post.new
    @post.beer = Beer.new
  end

  def create
  	
  	@post = current_user.posts.build(params[:post])
    authorize! :create, @post, message: "You need to be signed in to do that."
    # look up beer by name
    # create beer if it doesn't exist
    # create new description
  	if @post.save
  		flash[:notice] = "Post was saved."
  		redirect_to @post
  	else
  		flash[:error] = "There was a problem saving the Post. Please try again."
  		render :new
  	end
  end

  def edit
  	@post = Post.find(params[:id])
    
  end

  def update
  	@post = Post.find(params[:id])
    authorize! :edit, @post, message: "You need to own the post to edit it."
  	if @post.update_attributes(params[:post])
  		flash[:notice] = "Post was updated."
  		redirect_to @post
  	else
  		flash[:error] = "There was a problem updating the Post. Please try again."
  		render :edit
  	end
  end

  def destroy
    @post = Post.find(params[:id])
    name = @post.title
    authorize! :destroy, @post, message: "You need to own the Post to delete it."
    if @post.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to posts_path
    else
      flash[:error] = "There was an error deleting the post."
      render :show
    end
  end
end
