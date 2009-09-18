class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
    # puts @user_session.errors.methods.sort
    # @user_session.errors.add_to_base(nil)
    # @user_session.errors.instance_variable_set(:@base, nil)
    # p @user_session
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def destroy
    destroy! { root_path }
  end
end