class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end
  # def index
  #   page = params.fetch(:page).to_i
  #   count = User.count
  #   users = User.offset((page - 1) * Constants::ITEMS_PER_PAGE).limit(Constants::ITEMS_PER_PAGE)

  #   render json: { users: users, page: page, total_pages: (count / Constants::ITEMS_PER_PAGE.to_f).ceil }
  # end

  # GET /users/1
  def show
    render json: @user.present.user_context, include: :posts
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  def page_param
    @page = params.fetch(:page).to_i
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.permit(:full_name, :email)
  end
end
