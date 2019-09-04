class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show]
  before_action :only_your_profile_page, only: [:show]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end


  def edit
  end


  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to @user, notice: 'User was successfully created.'
      else
        render 'new'
      end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.' 
  end


   private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :encrypted_password)
    end

    #Methode permettant de restreindre l'accès à un utilisateur uniquement à sa page de profil
    def only_your_profile_page
      @user = User.find(params[:id])
    
      if current_user != @user
        redirect_to items_path, notice: "Access denied! You can only view your own profile page."
      end
    end

end
