class SessionsController < ApplicationController
  defaults :resource_class => User
  
  def create
    @session = User.new(params[:user])
    if User.authenticate(@session.email, @session.password)
      self.current_user = @session
      flash[:notice] = "Welcome #{@session.email}!"
      redirect_to articles_path #root_path
    else
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