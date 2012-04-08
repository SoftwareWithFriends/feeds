class TopicsController < ApplicationController
  
  def create
    name = params["topic"]["name"]
    manager = TopicManager.from_name(name)
    post  = Post.find params["post_id"]
    
    added_to_post = manager.update_post(post)
    respond_to do |format|
       format.html { redirect_to :back }
       format.json { render :json => {added_to_post: added_to_post, name: name, found: manager.found} }
    end  
  end
  
end