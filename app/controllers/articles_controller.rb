class ArticlesController < ApplicationController
include ArticlesHelper
#before_action :authenticate_user!
    def index
        @article = Article.all
    end
    def show
        @article = Article.find(params[:id])
        @comment = Comment.new
        @comment.article_id = @article.id
    end
    def new
        @article = Article.new
    end
    def create
        @article = Article.new(article_params)
        @article.autor = current_user.username
        @article.save
flash.notice = "Article '#{@article.title}' created!"
  redirect_to article_path(@article)
    end
    def destroy
        @article = Article.find(params[:id]).destroy
flash.notice = "Article '#{@article.title}' deleted!"
        redirect_to action: "index"
    end
    def edit
        @article = Article.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
        @article.update(article_params)

        flash.notice = "Article '#{@article.title}' Updated!"

        redirect_to article_path(@article)
end
end
