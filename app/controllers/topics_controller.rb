class TopicsController < ApplicationController
 before_action :authenticate_user!
before_action :set_topic, only: [:edit, :update, :destroy]

 def index
  @topics = Topic.all
 end


 def new
  @topic = Topic.new
 end


 def create
  
  @topic = Topic.new(topics_params)
   
  if @topic.save
   redirect_to topics_path, notice: "Topicsを作成しました！"
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
  @topic = Topic.find(params[:id])
  @topic.destroy
  redirect_to topics_path, notice: "Topicsを削除しました！"
 end
 
  
 def show
 end


  private
    def topics_params
      params.require(:topic).permit(:title, :content, :picture)
    end
    
    def set_topic
      @topic = Topic.find(params[:id])
    end



end