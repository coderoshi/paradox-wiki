class LoadRootData < ActiveRecord::Migration
  require 'active_record/fixtures'
  def self.up
    down
    dir = File.join(File.dirname(__FILE__), 'required')
    Fixtures.create_fixtures(dir, 'users')
  end
  
  def self.down
    User.delete_all
  end
end
