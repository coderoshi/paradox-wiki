class Article < ActiveRecord::Base
  
  default_scope :order => 'created_at DESC'
  named_scope :published, lambda { |p| { :conditions => { :published => !(p =~ /false/i) } } }
  
  before_validation :generate_permalink
  validates_presence_of :title, :permalink
  validates_uniqueness_of :title, :permalink
  
  def generate_permalink
    self.permalink = title.downcase.gsub(/[^a-z0-9]+/i, '-')
  end
  
  def to_param
    permalink
  end
  
  def self.per_page
    50
  end
end
