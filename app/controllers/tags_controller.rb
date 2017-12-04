class TagsController < ApplicationController
def index 
@tag = Tag.all
end
def show
  @tag = Tag.find(params[:id])
end
def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy
flash.notice = "Tag '#{@tag.name}' deleted!"
        redirect_to action: "index"
    end
   
    def update
        @tag = Tag.find(params[:id])
        @tag.update(tag_params)

        flash.notice = "Tag '#{@tag.name}' Updated!"

        redirect_to tag_path(@tag)
end


end
