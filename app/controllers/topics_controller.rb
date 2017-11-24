class TopicsController < ApplicationController


 def index
  @topics = Topic.all
 end


 def new
  @topic = Topic.new
 end


 def create
  Topic.create(topics_params)
  redirect_to topics_path, notice: "Topicsを作成しました！"
 end

  
 def edit
  @topic = Topic.find(params[:id])
 end
  
  
 def update
  @topic.update(topics_params)
  redirect_to topics_path, notice: "Topicsを更新しました！"
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


end