class SessionsController < ApplicationController
  defaults :resource_class => User
  
  def create
    if @session = User.authenticate(params[:user][:email], params[:user][:password])
      self.current_user = @session
      flash[:notice] = "Welcome #{@session.email}!"
      redirect_to articles_path #root_path
    else
      @session = User.anonymous
      flash.now[:error] =  "Couldn't locate a user with those credentials"
      render :action => :new
    end
  end

  def destroy
    clear_session
    flash[:notice] = "Logged out!"
    redirect_to articles_path #root_path
  end
end