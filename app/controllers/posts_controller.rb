class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]

  # GET /posts
  def index
    page = params.fetch(:page).to_i
    count = Post.count
    posts = Post.offset((page - 1) * Constants::ITEMS_PER_PAGE).limit(Constants::ITEMS_PER_PAGE)

    render json: { posts: posts, offset: page, total_pages: (count / Constants::ITEMS_PER_PAGE.to_f).ceil }
  end

  # GET /posts/1
  def show
    render json: @post, include: :comments
  end

  def search
    posts = Post.where("LOWER(title) like ?", "%#{params[:search].downcase}%").or(
      Post.where("LOWER(content) like ?", "%#{params[:search].downcase}%"))

    render json: posts
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.permit(:title, :content, :user_id)
    end
end
