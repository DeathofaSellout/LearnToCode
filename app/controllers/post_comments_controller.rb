class PostCommentsController < ApplicationController
  before_action :set_post_comment, only: [:show, :edit, :update, :destroy]

  def index
    @post_comments = PostComment.all
  end

  def show
  end

  def new
    @post_comment = PostComment.new
  end

  # def edit
  #
  #   # @post_comment = PostComment.find_by_id(params[:post_comment_id])
  #   # @user = User.find_by_id(params[:user_id])
  #   # if current_user.id != @post.user_id
  #   #   redirect_to post_path(@post)
  #   # end
  #   # console.log("Yes")
  # end

  def create
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.user = current_user
    @post_comment.user_id = current_user.id
    @post_comment.save
    redirect_to posts_path
  end

  def update
    # @post_comment = PostComment.find_by_id(params[:post_comment_id])
    # @post_comment.update_attributes(post_comment_params)
    # redirect_to posts_url
    # respond_to do |format|
    #   if @post_comment.update(post_comment_params)
    #     format.html { redirect_to posts_url}
    #     format.json { render :show, status: :ok, location: @post_comment }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @post_comment.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    @post_comment.destroy
    redirect_to posts_path
  end

  private
    def set_post_comment
      @post_comment = PostComment.find(params[:id])
    end

    def post_comment_params
      params.require(:post_comment).permit(:comment, :post_id, :user_id)
    end
end
