class UsersController < ApplicationController
before_action :authenticate_user!
  def index
    @user = User.all
    @users = User.order('created_at DESC').paginate(page: params[:page], per_page: 30)
  end
def show
    @article = Article.new
  @user = User.find_by_username(params[:id])

end
end
