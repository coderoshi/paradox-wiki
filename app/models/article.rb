class Article < ActiveRecord::Base
  
  default_scope :order => 'created_at DESC'
  named_scope :published, lambda { |p| { :conditions => { :published => !(p =~ /false/i) } } }
  
  has_attached_file :upload
  attr_protected :upload_file_name, :upload_content_type, :upload_file_size
  
  before_validation :generate_permalink
  validates_presence_of :title, :permalink
  validates_uniqueness_of :title, :permalink
  
  def self.build_permalink(title)
    title.to_s.downcase.gsub(/[^a-z0-9]+/i, '-')
  end
  
  def generate_permalink
    self.permalink ||= Article.build_permalink(title)
  end
  
  def to_param
    permalink
  end
  
  def self.per_page
    50
  end
end