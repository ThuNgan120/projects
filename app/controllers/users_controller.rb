class UsersController < ApplicationController
    def index
    end

    def new
      @user = User.new
    end

    def create
      #   @user = User.new(user_params)
      #   if @user.save
      #      # Đăng nhập sau khi đăng ký
      #     redirect_to root_path, notice: "Registration successful!"
      #   else
      #     render :new, alert: "Error creating account."
      #   end

      @user = User.new(user_params)
      if 
        flash[:notice] = "Account created successfully."
        redirect_to users_path
      else @user.save
         flash[:alert] = "Failed to create account. Please check your input."
        render :new
      end
    end

    private
def user_params
  params.require(:user).permit(:email_address, :password, :password_confirmation)
end
end
