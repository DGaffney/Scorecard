class AddAnswerValues < ActiveRecord::Migration
  def self.up
    add_column :answers, :value, :float
  end

  def self.down
    remove_column :answers, :value
  end
end
