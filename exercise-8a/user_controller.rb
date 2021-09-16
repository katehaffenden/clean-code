# frozen_string_literal: true

# app/controllers/user_controller.rb
class UserController < ApplicationController
  def create
    form = CreateUserForm.new(user_params)
    if form.valid?
      user = CreateUserUnit.new(form).call
      redirect_to user_url(user)
    else
      flash[:notice] = form.errors[:error] # possibly incomplete error handling
      render :new
    end
  end

  attr_reader :user_params

  private

  def new
    CreateUserForm.new
  end

  def user_params
    params[:user].to_h
  end
end


