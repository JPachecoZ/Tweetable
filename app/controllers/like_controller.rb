class LikeController < ApplicationController

    # GET /tweets/new
  def new
    @tweet = Tweet.new
  end
    # GET /tweets/1/edit
  def edit
    like = Like.where(tweet_id: params[:id]).pluck(:id)

    notice_str = "Liked Tweet"
    if(like.length > 0)
        p like[0]
        Like.destroy(like[0])
        notice_str = "Unliked Tweet"
    else
        new_like = Like.new
        new_like.user_id = current_user.id
        new_like.tweet_id = params[:id]
        new_like.save
    end
    redirect_to request.referrer, notice: notice_str
  end
end
