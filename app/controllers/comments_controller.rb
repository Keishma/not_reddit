class CommentsController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_post, only: [:create]


  # POST /posts
  # POST /posts.json
  def create
    @comment = @post.comments.new(post_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to @post, notice: 'Comment was not created.' }
        #format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:comment).permit(:text)
    end
end
