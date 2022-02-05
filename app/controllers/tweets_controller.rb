class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]

  # GET /tweets
  def index    
    @tweet = Tweet.new
    @tweets = Tweet.all.order( "created_at Desc")    
  end

  # GET /tweets/1
  def show    
    @new_tweet = Tweet.new
    @reply = @tweet.replies.new
    @replies = @tweet.replies.all
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  def create
    p "*****************************************"
    pp tweet_params    
    p "*****************************************"
    if tweet_params[:replied_to_id]
      @this_tweet = Tweet.find(tweet_params[:replied_to_id])
      @reply = @this_tweet.replies.new(tweet_params)
      @reply.user = current_user
      if @reply.save
        redirect_to @this_tweet, notice: "Comment was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    else
      @tweet = Tweet.new(tweet_params)
      @tweet.user = current_user
      if @tweet.save
        redirect_to root_path, notice: "Tweet was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /tweets/1
  def update    
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: "Tweet was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet.destroy
    redirect_to tweets_url, notice: "Tweet was successfully destroyed."
  end

  def like_tweet
    redirect_to request.referrer, notice: "Liked Tweet"

  end

  def unlike_tweet
    redirect_to request.referrer, notice: "Unliked Tweet"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:body, :replies_count, :likes_count, :user_id, :replied_to_id)
    end
end
