class LikesController < ApplicationController

  def current_user                                                              
      super || guest_user                                                         
  end                                                                           
   
  def guest_user                                                                
     User.find(session[:guest_user_id].nil? ? session[:guest_user_id] = create_guest_user.id : session[:guest_user_id])
  end                                                                           
    
  def create_guest_user                                                         
    token = SecureRandom.base64(15)                                             
    user = User.new(:username => "Guest", :password => token, :email => "#{token}@mail.com")
    user.save(:validate => false) 
    user                                                                        
  end

  def index
    @tweet = Tweet.new
    @tweets = []

  end

  # GET /tweets/new
def new
  @tweet = Tweet.new
end
  # GET /tweets/1/edit
def edit
  if(current_user.nil?)
      like = Like.where(tweet_id: params[:id], user_id: 0).pluck(:id)
  else
      like = Like.where(tweet_id: params[:id], user_id: current_user.id).pluck(:id)
  end

  notice_str = "Liked Tweet"
  if(like.length > 0)
      p like[0]
      Like.destroy(like[0])
      notice_str = "Unliked Tweet"
  else
      new_like = Like.new
      if(current_user.nil?)
          new_like.user_id = 0
      else
          new_like.user_id = current_user.id 
      end
      new_like.tweet_id = params[:id]
      p new_like
      new_like.save
  end
  redirect_to request.referrer, notice: notice_str
end
end
