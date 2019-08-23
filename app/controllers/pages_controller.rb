class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :show_form, :choose_form]

  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  def home
    redirect_to discover_path if signed_in?
  end

  def show_form
    @resource ||= User.new
    @option = params['option'] || ''

    respond_to do |format|
      format.js
    end
  end

  def choose_form
    @option = params['option']
    @resource ||= User.new

    respond_to do |format|
      format.js
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
