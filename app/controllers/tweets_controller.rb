class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show, :destroy, :update]


  def index
    @tweets = Tweet.order(created_at: :desc)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def tag
    @tag = Tag.find(params[:tag_id])
    @tweets = @tag.tweets.build
  end

  def show
  end

  def edit
  end

  def update
    if @tweets_tag.update(tweet_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @tweet.destroy
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  private

  def tweet_params
    params.require(:tweet).permit(:message, :name, :hashname, :image, tag_ids:[])
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end
