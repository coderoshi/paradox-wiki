class User < ActiveRecord::Base
  include SimplestAuth::Model
  
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => RFC822::EmailAddress, :message => "must be a valid email address"
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password, :if => :password_required?

  authenticate_by :email
  
  def self.anonymous
    User.new(:email => 'anonymous@pythonparadox.com', :password => 'anonymous')
  end
end
