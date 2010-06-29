class CreateCases < ActiveRecord::Migration
  def self.up
    create_table :cases do |t|
      t.integer :original_resource_id
      t.integer :derivative_resource_id
      t.text :facts
      t.integer :survey_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cases
  end
end
