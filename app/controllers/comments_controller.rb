class CommentsController < ApplicationController
  # コメントを保存、投稿するためのアクションです。
  def create
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic
    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_path(@topic), notice: '投稿しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
   @comment = Comment.find(params[:id])
   @comment.destroy
    respond_to do |format|
      format.js { render :index }
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end
    
end