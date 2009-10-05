class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.integer :parent_id, :default => nil
      t.string :title, :null => false
      t.string :shortname, :null => false
      t.boolean :show_in_navigation, :default => false
      t.string :description, :default => nil
      t.text :body
      t.integer :sort, :default => 1
      t.integer :author_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end