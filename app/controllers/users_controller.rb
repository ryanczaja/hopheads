#Used to display the user on their own users page. Also displays the posts for that user.
class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts
  end
end
