class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show, :destroy, :update]
  before_action :move_to_index, except: [:index, :show]

  def index
    @tweets = Tweet.order(created_at: :desc).includes(:user)
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

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @tweet.destroy
  end

  # def search
  #   return nil if params[:keyword] == ""
  #   tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
  #   render json:{ keyword: tag }
  # end


  def tag
    @tag = Tag.find_by(name: params[:name])
    @tweets = @tag.tweets.distinct.order(created_at: :desc)
  end


  private

  def tweet_params
    params.require(:tweet).permit(:message, :name, :hashname, :image, tag_ids:[]).merge(user_id: current_user.id)
  end


  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
