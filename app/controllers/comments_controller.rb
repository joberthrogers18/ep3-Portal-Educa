class CommentsController < ApplicationController
def index
    @comment = Comment.all
end

def show
    @comment = Comment.find(params[:id])
end

def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.author_name = current_user.username
    
    @comment.save

    redirect_to article_path(@comment.article)

end

def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to article_path(@comment.article) 

end

def edit
    @comment = Comment.find(params[:id])
end

def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)

    flash.notice = "Comentário Atualizado!"

    redirect_to article_path(@comment.article)
end

def comment_params
  params.require(:comment).permit(:author_name, :body)
end

end
