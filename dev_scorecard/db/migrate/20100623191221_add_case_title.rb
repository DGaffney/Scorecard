class AddCaseTitle < ActiveRecord::Migration
  def self.up
    add_column :cases, :title, :string
  end

  def self.down
    remove_column :cases, :title
  end
end
