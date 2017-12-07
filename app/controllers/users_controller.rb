class UsersController < ApplicationController
  def index
    @user = User.all

  end
def show
            @article = Article.find_by_author(params[:id])

  @user = User.find_by_username(params[:id])

end
end
