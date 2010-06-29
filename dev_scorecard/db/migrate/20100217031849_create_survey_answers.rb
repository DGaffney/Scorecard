class CreateSurveyAnswers < ActiveRecord::Migration
  def self.up
    create_table :survey_answers do |t|
      t.integer :survey_id
      t.integer :question_id
      t.integer :answer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :survey_answers
  end
end
