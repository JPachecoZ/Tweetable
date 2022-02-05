class LikesController < ApplicationController
  def index
    @tweet = Tweet.new
    @user = current_user
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
