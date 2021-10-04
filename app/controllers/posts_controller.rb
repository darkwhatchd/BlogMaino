class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[ create edit update destroy ]
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :verify_user, only: %i[ edit update destroy ]

  # GET /posts or /posts.json
  # Posts pagination oredered
  def index
    @posts = Post.all.with_rich_text_body_and_embeds.order(
      created_at: :desc
    ).page(params[:page]).per(3)
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :resume, :cover, :body, :user_id)
    end

    # Verify if Post_user is same current user to permit update and destroy
    def verify_user
      unless current_user.id == @post.user_id
        redirect_to posts_url, notice: "Permission denied"
      end
    end
end
