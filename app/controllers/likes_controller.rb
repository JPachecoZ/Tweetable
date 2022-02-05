class LikesController < ApplicationController
  def index
    @tweet = Tweet.new
    @user = current_user
    @tweets = []

  end
end
