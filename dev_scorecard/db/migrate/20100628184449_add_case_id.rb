class AddCaseId < ActiveRecord::Migration
  def self.up
    add_column :user_answers, :case_id, :integer
  end

  def self.down
    remove_column :user_answer, :case_id
  end
end
