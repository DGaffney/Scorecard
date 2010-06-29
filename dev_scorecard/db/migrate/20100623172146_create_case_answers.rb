class CreateCaseAnswers < ActiveRecord::Migration
  def self.up
    create_table :case_answers do |t|
      t.integer :case_id
      t.integer :answer_id
      t.integer :survey_id

      t.timestamps
    end
  end

  def self.down
    drop_table :case_answers
  end
end
