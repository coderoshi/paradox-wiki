class User < ActiveRecord::Base
  acts_as_authentic

  before_destroy do |user|
    user.errors.add(:editable, "Cannot destory this user") if !user.editable?
    user.editable?
  end

  before_save do |user|
    user.errors.add(:editable, "Cannot edit this user") if !user.editable?
    user.editable?
  end
  
  def editable?
    email != 'anonymous@pythonparadox.com'
  end
  
  def self.anonymous
    User.new(:email => 'anonymous@pythonparadox.com', :password => 'anonymous')
  end
end
