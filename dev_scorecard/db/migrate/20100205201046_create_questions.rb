class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :survey_id
      t.string  :content
      t.integer :parent_id
      t.integer :order
      t.integer :bonus

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
