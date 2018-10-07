class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_vote, only: [:update]

  def create
    @vote = @post.votes.new(vote_params.merge(user: current_user))

    if @vote.save
      flash[:success] = 'Thanks for voting'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to posts_path
  end

  def update
    if @vote.update(vote_params)
      flash[:success] = 'Thanks for voting'
    else
      flash[:warning] = 'Something went wrong'
    end
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def vote_params
    params.require(:vote).permit(:direction)
  end
end