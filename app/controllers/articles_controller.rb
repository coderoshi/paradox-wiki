class ArticlesController < ApplicationController
  # has_scope, create!, resource and collection are all overrides of
  # inherited_resources @ http://github.com/josevalim/inherited_resources/tree/master
  has_scope :published
  
  def create
    create!{ collection_url }
  end
  
protected
  
  def resource
    @article ||= end_of_association_chain.find_by_permalink(Article.build_permalink(params[:id])) || Article.new(:title => params[:id])
  end
  
  def collection
    @articles ||= end_of_association_chain.paginate(:page => params[:page])
  end
end
