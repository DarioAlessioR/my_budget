class UsersController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy]

  def welcome
    redirect_to categories_path if user_signed_in?
  end

  # GET /users or /users.json
  def index
    before_action :authenticate_user!
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    before_action :authenticate_user!
  end

  # GET /users/new
  def new
    before_action :authenticate_user!
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    before_action :authenticate_user!
  end

  # POST /users or /users.json
  def create
    before_action :authenticate_user!
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    before_action :authenticate_user!
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    before_action :authenticate_user!
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name)
  end
end
