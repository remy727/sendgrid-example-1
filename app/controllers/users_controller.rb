# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    # Create the user from params
    @user = User.new(user_params)
    if @user.save
      # Deliver the signup email
      UserNotifierMailer.send_signup_email(@user).deliver

      render(json: { success: true }, status: :created)
    else
      render(json: { success: false }, status: :bad_request)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :login)
  end
end
