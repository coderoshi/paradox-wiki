class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :permalink
      t.string :title
      t.text :body
      t.boolean :published, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
