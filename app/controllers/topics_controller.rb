class TopicsController < ApplicationController
 before_action :authenticate_user!
before_action :set_topic, only: [:edit, :update, :destroy, :show]

 def index
  @topics = Topic.all
 end

 def show
  @comment = @topic.comments.build
  @comments = @topic.comments
 end


 def new
  @topic = Topic.new
 end


 def create
  
  @topic = Topic.new(topics_params)
  @topic.user_id = current_user.id
   
  if @topic.save
   redirect_to topics_path, notice: "Topicsを作成しました！"
   NoticeMailer.sendmail_topic(@topic).deliver
  else
   render 'new'
  end
  
 end

  
 def edit
  @topic = Topic.find(params[:id])
 end
  
  
 def update
  @topic = Topic.find(params[:id])
  @topic.update(topics_params)
  
  if @topic.update(topics_params)
   redirect_to topics_path, notice: "Topicsを更新しました！"
  else
   render 'edit'
  end
  
 end
 
 
 def destroy
  # @topic = Topic.find(params[:id])
  @topic.destroy
  redirect_to topics_path, notice: "Topicsを削除しました！"
 end
 


  private
    def topics_params
      params.require(:topic).permit(:title, :content, :picture, :user_id)
    end
    
    def set_topic
      @topic = Topic.find(params[:id])
    end



end