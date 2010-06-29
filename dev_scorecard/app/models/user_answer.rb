class UserAnswer < ActiveRecord::Base
  named_scope :user, lambda { |user|
   { :conditions => { :user_id => user.id } }
  }
  #named_scope :user, lambda { |*args| {:conditions => ["user_id = ?", args.first]} }
  belongs_to :answer
  belongs_to :user
  belongs_to :survey
  belongs_to :case
  validates_presence_of :user_id, :answer_id, :survey_id
end
