class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.column :case_id, :integer, :null => false
      t.column :user_id, :integer, :null => false
      t.column :default, :boolean, :null => false, :default => false
      t.column :created_at, :datetime, :null => false
      t.column :parent_id,  :integer, :null => true
      t.column :content_type, :string, :null => false
      t.column :filename, :string, :null => false
      t.column :thumbnail, :string, :null => true
      t.column :size, :integer, :null => false
      t.column :width, :integer, :null => true
      t.column :height, :integer, :null => true
    end
  end

  def self.down
    drop_table :work_images
  end
end

