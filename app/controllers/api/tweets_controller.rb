module Api
  class TweetsController < ApiController
    before_action :set_tweet, only: %i[ show update destroy ]

    # GET /tweets
    def index    
      @tweet = Tweet.new
      @tweets = Tweet.all.order( "updated_at Desc")
      render json: @tweets, status: :ok
    end

    # GET /tweets/1
    def show    
      @new_tweet = Tweet.new
      @reply = @tweet.replies.new
      @replies = @tweet.replies.all
      render json: @tweet, status: :ok
    end


    # POST /tweets
    def create
      if tweet_params[:replied_to_id]
        @this_tweet = Tweet.find(tweet_params[:replied_to_id])
        @reply = @this_tweet.replies.new(tweet_params)
        @reply.user = User.first
        if @reply.save
          render json: @reply, status: :created
        else
          render json: { errors: @reply.errors }, status: :unprocessable_entity
        end
      else
        @tweet = Tweet.new(tweet_params)
        @tweet.user = User.first
        if @tweet.save
          render json: @tweet, status: :created
        else
          render json: { errors: @tweet.errors }, status: :unprocessable_entity
        end
      end
    end

    # PATCH/PUT /tweets/1
    def update
      authorize(@tweet)
      if @tweet.update(tweet_params)
        render json: @tweet, status: :ok
      else
        render json: { errors: @tweet.errors }, status: :unprocessable_entity
      end
    end

    # DELETE /tweets/1
    def destroy
      authorize(@tweet)
      @tweet.destroy
      head :no_content
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
end