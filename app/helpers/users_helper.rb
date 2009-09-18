module UsersHelper
  def users_form(form)
     render :partial => 'users/form', :locals => {:form => form}
  end
end
