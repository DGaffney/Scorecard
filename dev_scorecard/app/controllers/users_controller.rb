class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def new
    @user = User.new
  end
  def index
    if !current_user.nil?
      if current_user.role == "admin"
        @users = User.all
        @anonymous_users = @users.select{|u| u.anonymous}
        @listed_users = @users.select{|u| !u.anonymous}
      else
        flash[:notice] = "You must be an administrator to edit users"
        redirect_back_or_default root_url
      end
    else
      flash[:notice] = "You must be logged in to use that page"
      redirect_back_or_default root_url
    end
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end
  
  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end

  def promote
    @user = User.find(params[:id])
    case @user.role
    when "user"
      @user.role = "admin"
    end
    @user.save
  end

end
