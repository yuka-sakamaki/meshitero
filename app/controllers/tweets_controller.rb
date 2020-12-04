class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show, :destroy, :update]


  def index
    @tweets = Tweet.all.order(created_at: :desc)

    if params[:tag_id]
      @tag_list = Tag.all
      @tag = Tag.find(params[:tag_id])
      @tweets = Tweet.all.order(created_at: "DESC")
    else
      @tag_list = Tag.all
      @tweets = Tweet.all.order(created_at: "DESC")
    end

  end

  def new
    @tweet = TweetsTag.new
  end

  def create
    @tweet = TweetsTag.new(tweet_params)
    tag_list = params[:name]
    if @tweet.save
      @tweet.save_tweets(tag_list)
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
  end

  def edit
    @tag_list = @tweet.tags.pluck(:name).join(',')
  end

  def update
    tag_list = params[:tweet][:name].split(',')
    if @tweet.update(tweet_params)
      @tweet.save_tweets(tag_list)
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
    tag_list = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag_list }
  end

  private

  def tweet_params
    params.require(:tweets_tag).permit(:message, :name, :image)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end
