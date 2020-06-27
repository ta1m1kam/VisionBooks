# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user.present?
      log_in user
      flash[:success] = 'log in'
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = 'log out'
    redirect_to root_url
  end
end
