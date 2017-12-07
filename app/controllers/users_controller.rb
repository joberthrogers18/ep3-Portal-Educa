class UsersController < ApplicationController
  def index
    @user = User.all

  end
def show
    @article = Article.new
  @user = User.find_by_username(params[:id])

end
end
